#' @name concerto.unserialize
#' @aliases concerto.unserialize
#' @title concerto.unserialize
#' @description Not clearly documented
#' @author Przemyslaw Lis
#' @export
#' 

concerto.unserialize <- function() {
    print("unserializing session...")
    restore.session(concerto$sessionPath)
} 
