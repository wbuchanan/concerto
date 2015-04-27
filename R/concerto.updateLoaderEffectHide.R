#' @name concerto.updateLoaderEffectHide
#' @aliases concerto.updateLoaderEffectHide
#' @title concerto.updateLoaderEffectHide
#' @description Not clearly documented
#' @param effectHide Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' 

concerto.updateLoaderEffectHide <- function(effectHide) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    effectHide <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(effectHide))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `loader_effect_hide` = '%s' WHERE `id`=%s", 
        dbName, effectHide, sessionID))
} 
