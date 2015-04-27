#' @name concerto.finalize
#' @aliases concerto.finalize
#' @title concerto.finalize
#' @description Undocumented function used to update status and close DB connection
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.finalize <- function() {
    print("finalizing...")
    
    closeAllConnections()
    
	concerto:::concerto.test.updateAllReturnVariables()
	concerto:::concerto.updateStatus(3)
    RMySQL::dbDisconnect(concerto$db$connection)
    
} 
