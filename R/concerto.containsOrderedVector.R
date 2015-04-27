#' @name concerto.containsOrderedVector 
#' @aliases concerto.containsOrderedVector 
#' @title concert.containsOrderedVector
#' @description Undocumented function
#' @param subject Something
#' @param search Something else
#' @return Logical
#' @author Przemyslaw Lis
#' @export
#'

concerto.containsOrderedVector <- function(subject, search) {
    j = 1
    for (i in subject) {
        if (search[j] == i) {
            if (length(search) == j) 
                return(TRUE)
            j = j + 1
        } else {
            j = 1
        }
    }
    return(FALSE)
} 
