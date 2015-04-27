#' @name concerto.updateHTML
#' @aliases concerto.updateHTML
#' @title concerto.updateHTML
#' @description Not clearly documented
#' @param html Not clearly documented
#' @import RMySQL
#' 

concerto.updateHTML <- function(html) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    html <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(html))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `HTML` = '%s' WHERE `id`=%s", 
        dbName, html, sessionID))
} 
