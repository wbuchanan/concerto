#' @name concerto.updateEffectShowOptions
#' @aliases concerto.updateEffectShowOptions
#' @title concerto.updateEffectShowOptions
#' @description Not clearly documented
#' @param effectShowOptions Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @import rjson
#' 

concerto.updateEffectShowOptions <- function(effectShowOptions) {
    if (is.list(effectShowOptions)) {
        effectShowOptions <- rjson::toJSON(effectShowOptions)
    }
    
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    effectShowOptions <- RMySQL::dbEscapeStrings(concerto$db$connection, 
						toString(effectShowOptions))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `effect_show_options` = '%s' WHERE `id`=%s", 
        dbName, effectShowOptions, sessionID))
} 
