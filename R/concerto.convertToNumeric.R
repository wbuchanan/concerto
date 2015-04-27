#' @name concerto.convertToNumeric 
#' @aliases concerto.convertToNumeric 
#' @title concert.convertToNumeric
#' @description Undocumented function
#' @param var Character vector to be coerced to numeric
#' @return Numeric
#' @author Przemyslaw Lis
#' @export
#'

concerto.convertToNumeric <- function(var) {
    result <- tryCatch({
        if (is.character(var)) 
            var <- as.numeric(var)
        return(var)
    }, warning = function(w) {
        return(var)
    }, error = function(e) {
        return(var)
    }, finally = function() {
        return(var)
    })
    return(result)
} 
