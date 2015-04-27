#' @name concerto.qti.contains
#' @aliases concerto.qti.contains 
#' @title concerto.qti.contains
#' @description Undocumented function
#' @param exp1 Not clearly documented
#' @param exp2 Not clearly doocumented
#' @param baseType String used to identify if data are paired
#' @param cardinality String used to identify if data in exp1 and exp2 are ordered
#' @author Przemyslaw Lis
#' @export
#' 

concerto.qti.contains <- function(exp1, exp2, baseType, cardinality) {
    if (cardinality == "ordered") {
        if (baseType != "pair") {
        	concerto:::concerto.containsOrderedVector(exp1, exp2)
        } else {
            j = 1
            for (i in exp1) {
                v2 = unlist(strsplit(i, " "))
                v2 = paste(v2[2], " ", v2[1], sep = "")
                if (exp2[j] == i || exp2[j] == v2) {
                  if (length(exp2) == j) 
                    return(TRUE)
                  j = j + 1
                } else {
                  j = 1
                }
            }
            return(FALSE)
        }
    } else {
        if (baseType != "pair") {
            all(exp2 %in% exp1)
        } else {
            for (i in exp2) {
                v2 = unlist(strsplit(i, " "))
                v2 = paste(v2[2], " ", v2[1], sep = "")
                if (!i %in% exp1 && !v2 %in% exp1) 
                  return(FALSE)
            }
            return(TRUE)
        }
    }
}
 
