
############################
## Sourcing the functions ##
############################

source("r_code/data_prep/data_gen_functions.R")
source("r_code/utils/utils.R")

#################################
## Defining output directories ##
#################################

## Main output directory:
OUTPUT_DIR <- file.path("..")

## Generated data:
DATA_DIR <- file.path(OUTPUT_DIR, "data")
create_directory(DATA_DIR)

#########################
## Simulating the data ##
#########################

## Creating a simulated count matrix and associated metadata
counts_metadata_list <- generate_counts_with_metadata(
    output_path = DATA_DIR,
    number_of_genes = 1000,
    number_of_samples = 10,
    seed = 567,
    condition_vector = c("Control", "Treatment"))
