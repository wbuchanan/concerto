#' @name concerto.serialize
#' @aliases concerto.serialize
#' @title concerto.serialize
#' @description Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.serialize <- function() {
    print("serializing session...")
    closeAllConnections()
    if (exists("onSerialize")) 
        do.call("onSerialize", list(), envir = .GlobalEnv)
    save.session(concerto$sessionPath)
	concerto:::concerto.updateStatus(7)
    RMySQL::dbDisconnect(concerto$db$connection)
    print("serialization finished")
    # stop('done')
    Sys.sleep(3600)
} 
