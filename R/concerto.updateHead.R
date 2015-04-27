#' @name concerto.updateHead
#' @aliases concerto.updateHead
#' @title concerto.updateHead
#' @description Not clearly documented
#' @param html Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' 

concerto.updateHead <- function(html) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    html <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(html))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `head` = '%s' WHERE `id`=%s", 
        dbName, html, sessionID))
} 
