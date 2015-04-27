#' @name concerto.updateLoaderEffectHideOptions
#' @aliases concerto.updateLoaderEffectHideOptions
#' @title concerto.updateLoaderEffectHideOptions
#' @description Not clearly documented
#' @param effectHideOptions Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @import rjson
#' @export
#' 

concerto.updateLoaderEffectHideOptions <- function(effectHideOptions) {
    if (is.list(effectHideOptions)) {
        effectHideOptions <- rjson::toJSON(effectHideOptions)
    }
    
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, 
						toString(concerto$sessionID))
    effectHideOptions <- RMySQL::dbEscapeStrings(concerto$db$connection, 
						toString(effectHideOptions))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `loader_effect_hide_options` = '%s' WHERE `id`=%s", 
        dbName, effectHideOptions, sessionID))
} 
