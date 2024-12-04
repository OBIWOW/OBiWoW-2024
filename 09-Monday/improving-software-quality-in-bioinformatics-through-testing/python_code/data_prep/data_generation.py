import os

from data_gen_functions import *
from pathlib import Path

#########################
## Simulating the data ##
#########################

## Main output directory:
OUTPUT_DIR = Path('results')
os.makedirs(OUTPUT_DIR, exist_ok=True)

## Generated data:
DATA_DIR = os.path.join(OUTPUT_DIR, 'data')
os.makedirs(DATA_DIR, exist_ok=True)

COUNT_MAT_PATH = os.path.join(DATA_DIR, 'count_matrix.pkl')
METADATA_PATH = os.path.join(DATA_DIR, 'metadata.tsv')

## Create example RNA-seq count matrix and metadata
count_df,metadata = generate_counts_with_metadata(
    COUNT_MAT_PATH,
    METADATA_PATH,
    number_of_genes=1000,
    number_of_samples=10,
    condition_vector=['Control', 'Treatment'],
    seed=567,
)