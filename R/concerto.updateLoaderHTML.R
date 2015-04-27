#' @name concerto.updateLoaderHTML
#' @aliases concerto.updateLoaderHTML
#' @title concerto.updateLoaderHTML
#' @description Not clearly documented
#' @param loaderHTML Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#'

concerto.updateLoaderHTML <- function(loaderHTML) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    loaderHTML <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(loaderHTML))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `loader_HTML` = '%s' WHERE `id`=%s", 
        dbName, loaderHTML, sessionID))
} 
