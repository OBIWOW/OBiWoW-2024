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

source(file.path(here::here(), "r_code/test_example/R/convert_temperature.R"))

###################
## Running tests ##
###################

## Tests and functions taken from https://stirlingcodingclub.github.io/code_testing/testing_notes.html

## Testing each function with two tests each:

test_that(desc = "F_to_C correctly converts Fahrenheit to Celsius", code = {

    temp_C <- F_to_C(50); # Runs the function
    
    # Test that the result is the correct value
    expect_that(
        object = temp_C,
        condition = equals(10));
    
    # Test that the result is numeric
    expect_that(
        object = is.numeric(temp_C),
        condition = equals(TRUE));
})

test_that(desc = "C_to_F correctly converts Celsius to Fahrenheit", code = {
    
    temp_F <- C_to_F(10);
    
    # Test that the result is the correct value
    expect_that(
        object = temp_F,
        condition = equals(50));
    
    # Test that the result is numeric
    expect_that(
        object = is.numeric(temp_F),
        condition = equals(TRUE));
})

## Failed test example:

test_that(desc = "F_to_C goes wrong", code = {
    
    temp_F <- F_to_C(50);

    skip('skip')
    expect_that(
        object = temp_F,
        condition = equals(2));
})

