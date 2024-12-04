## Function is taken from https://discdown.org/rprogramming/testing.html#tinytest-in-r

#' Converting temperature in Celsius to Farenheit
#' 
#' @param C_temp
#' @returns Temperature in Farenheit
#' @examples
#' C_to_F(10)
meters2feet <- function(x) {

    if (!is.numeric(x)) {
        stop("The distance must be a number.") 
    }
    if (x < 0) {
        stop("The distance must be a non-negative number.")
    }
    return(3.28084 * x)

}  
