###########################
## Load required modules ##
###########################

import os

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from pandas.api.types import is_numeric_dtype
from pathlib import Path
from pydeseq2.dds import DeseqDataSet
from pydeseq2.ds import DeseqStats
from warnings import warn

#################################
## Defining output directories ##
#################################

## Main output directory:
OUTPUT_DIR = Path('results')
os.makedirs(OUTPUT_DIR, exist_ok=True)

## Generated data:
DATA_DIR = os.path.join(OUTPUT_DIR, 'data')
os.makedirs(DATA_DIR, exist_ok=True)

## Produced results:
RESULTS_DIR = os.path.join(OUTPUT_DIR, 'results')
os.makedirs(RESULTS_DIR, exist_ok=True)

#########################
## Simulating the data ##
#########################

COUNT_MAT_PATH = os.path.join(DATA_DIR, 'count_matrix.pkl')
METADATA_PATH = os.path.join(DATA_DIR, 'metadata.tsv')

## DATA 1
## Create example RNA-seq count matrix and export it

seed = 567
rng = np.random.default_rng(seed)
num_genes = 1000
num_samples = 10

counts = rng.integers(0, 100, size=(num_genes, num_samples), endpoint=True)
colnames = [f'Sample{i}' for i in range(1, num_samples+1)]
rownames = [f'Gene{i}' for i in range(1, num_genes+1)]
count_df = pd.DataFrame(counts, index=rownames, columns=colnames)

count_df.to_pickle(COUNT_MAT_PATH)

## DATA 2
## Create metadata and export it

conditions = rng.choice(['Control', 'Treatment'], num_samples)
metadata = pd.DataFrame(conditions, index=colnames, columns=['Condition'])

metadata.to_csv(METADATA_PATH, sep='\t')

####################################
## Reading and checking the input ##
####################################

## Loading the count matrix:
count_df = pd.read_pickle(COUNT_MAT_PATH)

## Reading the metadata:
metadata = pd.read_csv(METADATA_PATH, sep='\t', index_col=0)

## Checking the input:
if not np.all(count_df.dtypes.apply(is_numeric_dtype)):
    exit('Data frame contains non-numeric values.')

if count_df.isna().sum().sum() > 0:
    warn('Matrix contains missing values. Consider adding pseudocounts or '
        'data imputation.')
    
##########################
## Processing the input ##
##########################

## Impute missing values using average:
count_df = count_df.T.fillna(count_df.mean(axis=1)).T

## Add pseudocount:
pseudocount = 1
count_df += pseudocount

## Filtering lowly expressed genes:
min_counts = 10
keep_genes = (count_df >= min_counts).sum(axis=1) > 0
count_df = count_df.loc[keep_genes]

#######################################################
## Performming differential gene expression analysis ##
#######################################################

## Perform differential gene expression using PyDESeq2
dds = DeseqDataSet(
    counts = count_df.T,
    metadata = metadata,
    design_factors = 'Condition',
)
dds.deseq2()
stat_res = DeseqStats(dds)
stat_res.summary()

## Extract differential expression results
res = stat_res.results_df

###################################################
## Plotting differential gene expression results ##
###################################################

fig,ax = plt.subplots(figsize=(6,6))
ax.scatter(
    x=res['log2FoldChange'],
    y=res['padj'].apply(lambda x: -np.log10(x)),
    s=1.5,
    c=['red' if i < 0.05 else 'black' for i in res['padj']],
)
ax.set_xlabel('Log2 Fold Change')
ax.set_ylabel('-Log10 p-value')
ax.set_title('DGE results')

###########################
## Exporting the results ##
###########################

PATH_TO_DGE_RES = os.path.join(RESULTS_DIR, 'DGE_results.tsv')
PATH_TO_DGE_PLOT = os.path.join(RESULTS_DIR, 'DGE_results.pdf')

res.to_csv(PATH_TO_DGE_RES, sep='\t')

fig.savefig(PATH_TO_DGE_PLOT, dpi=300)