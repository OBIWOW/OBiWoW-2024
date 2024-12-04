## Functions taken from: https://stirlingcodingclub.github.io/code_testing/testing_notes.html

#' Converting temperature in Farenheit to Celsius
#' 
#' @param F_temp Temperature in Farenheit
#' @returns Temperature in Celsius
#' @examples
#' F_to_C(10)
F_to_C <- function(F_temp){
    C_temp <- (F_temp - 32) * 5/9;
    return(C_temp);
}

#' Converting temperature in Celsius to Farenheit
#' 
#' @param C_temp
#' @returns Temperature in Farenheit
#' @examples
#' C_to_F(10)
C_to_F <- function(C_temp){
    F_temp <- (C_temp * 9/5) + 32;
    return(F_temp);
}
