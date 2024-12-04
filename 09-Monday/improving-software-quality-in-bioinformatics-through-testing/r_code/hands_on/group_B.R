#############################
## Load required libraries ##
#############################

library(DESeq2)
library(ggplot2)
library(data.table)

############################
## Sourcing the functions ##
############################

source("r_code/utils/utils.R")

############################
## Defining the functions ##
############################

read_in_data <- function(count_matrix_file, metadata_file){
    ## Loading the count matrix:
    count_matrix <- get(load(count_matrix_file))

    ## Reading the metadata:
    metadata <- data.table::fread(
        metadata_file,
        header = TRUE,
        sep = "\t")

    ## Checking the input:
    if (!all(sapply(count_matrix, is.numeric))) {
        stop("Matrix contains non-numeric values.")
    }

    if (any(is.na(count_matrix))) {
        warning("Matrix contains missing values. Consider adding pseudocounts or data imputation.")
    }
    return(list(
        counts = count_matrix,
        metadata = metadata))
}


process_input <- function(
    count_matrix,
    pseudocount = 1,
    min_counts = 10){

    ## Impute missing values using average:
    count_matrix[is.na(count_matrix)] <- rowMeans(count_matrix, na.rm = TRUE)

    ## Add pseudocount:
    count_matrix <- count_matrix + pseudocount

    ## Filtering lowly expressed genes:
    keep_genes <- rowSums(count_matrix >= min_counts) > 0
    count_matrix <- count_matrix[keep_genes, ]

    return(count_matrix)
}



perform_de_analysis <- function(count_matrix, metadata){
    ## Perform differential gene expression using DESeq2
    dds <- DESeqDataSetFromMatrix(
        countData = count_matrix,
        colData = metadata,
        design = ~ Condition)
    dds <- DESeq(dds)

    ## Extract differential expression results
    res <- results(dds)

    return(res)
}

save_degs <- function(deg_res, results_dir){
    results <- as.data.frame(deg_res)
    dge_res_path <- file.path(results_dir, "DGE_results.tsv")
    data.table::fwrite(
        results,
        file = dge_res_path,
        sep = "\t",
        col.names = TRUE)
} 

plot_degs <- function(res){
    results_for_plotting <- as.data.frame(res)

    volcano_plot <- ggplot(
            data = results_for_plotting,
            aes(
                x = log2FoldChange,
                y = -log10(pvalue))) +
        geom_point(
            size = 1.5,
            color = ifelse(res$padj < 0.05, "red", "black")) +
        labs(
            x = "Log2 Fold Change",
            y = "-Log10 p-value",
            title = "DGE results") +
        theme_minimal()
    return(volcano_plot)
}

export_results <- function(results_dir, volcano_plot){
    dge_plot_path <- file.path(results_dir, "DGE_results.pdf")

    ggsave(
        volcano_plot,
        file = dge_plot_path,
        height = 6,
        width  = 6,
        limitsize = FALSE)
}


##########
## Main ##
##########

## Produced results:
RESULTS_DIR <- file.path("../results")

## Input data:
DATA_DIR <- file.path("r_code/data")

## Input files:
COUNT_MAT_PATH <- file.path(DATA_DIR, "count_matrix.RData")
METADATA_PATH  <- file.path(DATA_DIR, "metadata.tsv")

create_directory(RESULTS_DIR)
counts_metadata_list <- read_in_data(
    count_matrix_file = COUNT_MAT_PATH,
    metadata_file = METADATA_PATH)
processed_count_matrix <- process_input(
    count_matrix = counts_metadata_list$counts)
deseq_results <- perform_de_analysis(
    count_matrix = processed_count_matrix,
    metadata = counts_metadata_list$metadata)
save_degs(
    deg_res = deseq_results,
    results_dir = RESULTS_DIR)
deg_plot <- plot_degs(res = deseq_results)
export_results(
    results_dir = RESULTS_DIR,
    volcano_plot = deg_plot)
