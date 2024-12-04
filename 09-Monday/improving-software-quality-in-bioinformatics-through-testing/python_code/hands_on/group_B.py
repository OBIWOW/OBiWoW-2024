###########################
## Load required modules ##
###########################

import os

import pandas as pd

from pathlib import Path

############################
## Sourcing the functions ##
############################

from group_B_functions import *

#################################
## Defining output directories ##
#################################

## Generated data:
DATA_DIR = Path('data')
os.makedirs(DATA_DIR, exist_ok=True)

## Produced results:
RESULTS_DIR = Path('results')
os.makedirs(RESULTS_DIR, exist_ok=True)

####################################
## Reading and checking the input ##
####################################

COUNT_MAT_PATH = os.path.join(DATA_DIR, 'count_matrix.pkl')
METADATA_PATH = os.path.join(DATA_DIR, 'metadata.tsv')

## Loading the count matrix:
count_df = pd.read_pickle(COUNT_MAT_PATH)

## Reading the metadata:
metadata = pd.read_csv(METADATA_PATH, sep='\t', index_col=0)

## Checking the input:
check_counts(count_df)
    
##########################
## Processing the input ##
##########################

## Impute missing values using average:
count_df = process_counts(count_df, pseudocount=1, min_counts=10)

######################################################
## Performing differential gene expression analysis ##
######################################################

## Perform differential gene expression using PyDESeq2
res = calculate_deg(count_df, metadata, design_factors='Condition')

###################################################
## Plotting differential gene expression results ##
###################################################

ax = plot_deg_results(res)

###########################
## Exporting the results ##
###########################

PATH_TO_DGE_RES = os.path.join(RESULTS_DIR, 'DGE_results.tsv')
PATH_TO_DGE_PLOT = os.path.join(RESULTS_DIR, 'DGE_results.pdf')

res.to_csv(PATH_TO_DGE_RES, sep='\t')

ax.get_figure().savefig(PATH_TO_DGE_PLOT, dpi=300)