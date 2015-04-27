#' @name concerto.updateTimeLimit
#' @aliases concerto.updateTimeLimit
#' @title concerto.updateTimeLimit
#' @description Undocumented function
#' @param timeLimit value used to set the timelimit
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateTimeLimit <- function(timeLimit) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    timeLimit <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(timeLimit))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `time_limit` = '%s' WHERE `id`=%s", 
        dbName, timeLimit, sessionID))
} 
