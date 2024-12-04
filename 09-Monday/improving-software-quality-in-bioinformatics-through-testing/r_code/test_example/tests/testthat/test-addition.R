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

source(file.path(here::here(), "r_code/test_example/R/addition.R"))

###################
## Running tests ##
###################

test_that("add_two_numbers adds two negative numbers correctly", {
    expect_equal(
        info = "Adding two negative numbers",
        add_two_numbers(-10, -1),
        -11)
})

test_that("add_two_numbers adds two numbers correctly", {

    # Test case 1: adding two positive numbers
    x1 <- 1
    y1 <- 1
    expectation1 <- 2
    expect_equal(
        info = "Adding two positive numbers",
        add_two_numbers(x1, y1),
        expectation1)
    
    # Test case 2: adding positive and negative numbers
    x2 <- -1
    y2 <- 5
    expectation2 <- 4
    expect_equal(
        info = "Adding positive and negative numbers",
        add_two_numbers(x2, y2),
        expectation2)
    
    # Test case 3: adding zeroes
    x3 <- 0
    y3 <- 0
    expectation3 <- 0
    expect_equal(
        info = "Adding two zeroes",
        add_two_numbers(x3, y3),
        expectation3)
    
    # Test case 4
    x4 <- 3.5
    y4 <- 4.5
    expectation4 <- 8
    expect_equal(
        info = "Adding two floats",
        add_two_numbers(x4, y4),
        expectation4)
})
