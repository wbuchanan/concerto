#' @name concerto.updateLoaderHead
#' @aliases concerto.updateLoaderHead
#' @title concerto.updateLoaderHead
#' @description Not clearly documented
#' @param loaderHead Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateLoaderHead <- function(loaderHead) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    loaderHead <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(loaderHead))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `loader_head` = '%s' WHERE `id`=%s", 
        dbName, loaderHead, sessionID))
} 
