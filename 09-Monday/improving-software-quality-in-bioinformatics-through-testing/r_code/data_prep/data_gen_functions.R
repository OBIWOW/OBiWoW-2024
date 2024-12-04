#' Creating a simulated count matrix
#' 
#' @param output_path Path to data folder, where count matrix is saved (mandatory)
#' @param number_of_genes Number of genes to have in the matrix (default is 1000)
#' @param number_of_samples Number of samples to have in the matrix (default is 10)
#' @param seed Random seed for reproducibility (default is no seed)
#' @returns count_matrix
#' @examples
#' generate_counts(
#'  output_path = "output/data/",
#'  number_of_genes = 1000,
#'  number_of_samples = 10,
#'  seed = 567)
generate_counts <- function(
    output_path,
    number_of_genes,
    number_of_samples,
    seed = NA) {
    
    if (!is.na(seed)) {
        set.seed(seed)
    }

    count_matrix <- matrix(
        data = round(runif(number_of_genes * number_of_samples, min = 0, max = 100)),
        nrow = number_of_genes)
    colnames(count_matrix) <- paste0("Sample", 1:number_of_samples)
    rownames(count_matrix) <- paste0("Gene", 1:number_of_genes)

    save(
        count_matrix,
        file = file.path(output_path, "count_matrix.RData"))
    write.csv(
        count_matrix,
        file=file.path(output_path, "count_matrix.csv"))
    return(count_matrix)
}


#' Creating a simulated metadata associated to count matrix
#' 
#' @param output_path Path to data folder, where metadata is saved (mandatory)
#' @param number_of_samples Number of samples to have in the matrix (default is 10)
#' @param condition_vector Names of different conditions (default is "Treatment" and "Control")
#' @returns list(counts = count_matrix, metadata = metadata)
#' @examples
#' generate_metadata(
#'  output_path = DATA_DIR,
#'  number_of_samples = 10,
#'  condition_vector = c("Control", "Treatment"))
generate_metadata <- function(
    output_path,
    count_matrix,
    number_of_samples,
    condition_vector = c("Control", "Treatment")){
    metadata <- data.frame(
        Sample = colnames(count_matrix),
        Condition = sample(
            condition_vector, 
            size = number_of_samples,
            replace = TRUE),
        stringsAsFactors = FALSE)
    
    data.table::fwrite(
        metadata,
        file = file.path(output_path, "metadata.tsv"),
        sep = "\t",
        col.names = TRUE)

    return(metadata)
}

#' Creating a simulated count matrix and associated metadata
#' 
#' @param output_path Path to data folder, where count matrix and metadata is saved (mandatory)
#' @param number_of_genes Number of genes to have in the matrix (default is 1000)
#' @param number_of_samples Number of samples to have in the matrix (default is 10)
#' @param seed Random seed for reproducibility (default is no seed)
#' @param condition_vector Names of different conditions (default is "Treatment" and "Control")
#' @returns list(counts = count_matrix, metadata = metadata)
#' @examples
#' generate_counts_with_metadata(
#'  output_path = DATA_DIR,
#'  number_of_genes = 1000,
#'  number_of_samples = 10,
#'  seed = 567,
#'  condition_vector = c("Control", "Treatment"))
generate_counts_with_metadata <- function(
    output_path,
    number_of_genes = 1000,
    number_of_samples = 10,
    seed = NA,
    condition_vector = c("Control", "Treatment")) {

    ## Generating counts:
    count_matrix <- generate_counts(
        output_path = output_path,
        number_of_genes = number_of_genes,
        number_of_samples = number_of_samples,
        seed = seed)

    ## Generating metadata:
    metadata <- generate_metadata(
        output_path = output_path,
        count_matrix = count_matrix,
        number_of_samples = number_of_samples,
        condition_vector = condition_vector)

    return(list(
        counts = count_matrix,
        metadata = metadata))

}
