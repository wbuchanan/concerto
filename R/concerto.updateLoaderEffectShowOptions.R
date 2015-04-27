#' @name concerto.updateLoaderEffectShowOptions
#' @aliases concerto.updateLoaderEffectShowOptions
#' @title concerto.updateLoaderEffectShowOptions
#' @description Not clearly documented
#' @param effectShowOptions Not clearly documented
#' @author Przemyslaw Lis
#' @import rjson
#' @import RMySQL
#' @export
#' 

concerto.updateLoaderEffectShowOptions <- function(effectShowOptions) {
    if (is.list(effectShowOptions)) {
        effectShowOptions <- rjson::toJSON(effectShowOptions)
    }
    
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, 
						toString(concerto$sessionID))
    effectShowOptions <- RMySQL::dbEscapeStrings(concerto$db$connection, 
						toString(effectShowOptions))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `loader_effect_show_options` = '%s' WHERE `id`=%s", 
        dbName, effectShowOptions, sessionID))
} 
