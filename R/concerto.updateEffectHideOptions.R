#' @name concerto.updateEffectHideOptions
#' @aliases concerto.updateEffectHideOptions
#' @title concerto.updateEffectHideOptions
#' @description Not clearly documented
#' @param effectHideOptions Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateEffectHideOptions <- function(effectHideOptions) {
    if (is.list(effectHideOptions)) {
        effectHideOptions <- toJSON(effectHideOptions)
    }
    
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    effectHideOptions <- RMySQL::dbEscapeStrings(concerto$db$connection, 
					toString(effectHideOptions))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `effect_hide_options` = '%s' WHERE `id`=%s", 
        dbName, effectHideOptions, sessionID))
} 
