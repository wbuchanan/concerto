#' @name concerto.qti.delete
#' @aliases concerto.qti.delete
#' @title concerto.qti.delete
#' @description Not clearly documented
#' @param exp1 Not clearly documented
#' @param exp2 Not clearly documented
#' @param baseType Not clearly documented
#' @author Przemyslaw Lis
#' @return Not clearly documented
#' @export
#' 

concerto.qti.delete <- function(exp1, exp2, baseType) {
    if (baseType != "pair") 
        return((exp2)[which(exp2 != exp1)])
    result = c()
    for (i in exp2) {
        if (concerto:::concerto.qti.equal(i, exp1, "pair")) 
            result = c(result, i)
    }
    return(result)
}
 
