#' Creating a directory
#' 
#' @param dir_path Path to the directory (mandatory)
#' @returns None
#' @examples
#' create_directory("output/results")
create_directory <- function(dir_path) {
    if (!dir.exists(dir_path)) {
        dir.create(dir_path, recursive = TRUE, showWarnings = FALSE)
    }
}