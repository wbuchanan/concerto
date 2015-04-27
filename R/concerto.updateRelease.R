#' @name concerto.updateRelease
#' @aliases concerto.updateRelease
#' @title concerto.updateRelease
#' @description Not clearly documented
#' @param release Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateRelease <- function(release) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    release <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(release))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `release` = '%s' WHERE `id`=%s", 
        dbName, release, sessionID))
} 
