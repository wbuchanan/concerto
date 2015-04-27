#' @name concerto.updateStatus
#' @aliases concerto.updateStatus
#' @title concerto.updateStatus
#' @description Set method for status object
#' @param status Test status
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateStatus <- function(status) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    status <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(status))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `status` = '%s' WHERE `id`=%s", 
        dbName, status, sessionID))
} 
