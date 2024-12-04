## testthat::test_dir("./r_code/test_example/tests/testthat")

##############################
## Load or install packages ##
##############################

if (!require("testthat", quietly = TRUE)) {
    install.packages("testthat") }
if (!require("here", quietly = TRUE)) {
    install.packages("here") }
    
###########################
## Loading the functions ##
###########################

source(file.path(here::here(), "r_code/test_example/R/convert_distance.R"))

###################
## Running tests ##
###################

test_that("meters2feet handles characters", {

    ## Test case 1: atempting to conver a character
    expect_error(
        info = "Attempting to convert character",
        meters2feet("a"))

    ## Test case 2: handling zero conversion 
    expect_equal(
        info = "Converting zero",
        meters2feet(0),
        0)  
})