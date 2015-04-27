#' @name concerto.updateEffectShow
#' @aliases concerto.updateEffectShow
#' @title concerto.updateEffectShow
#' @description Not clearly documented
#' @param effectShow Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' 

concerto.updateEffectShow <- function(effectShow) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    effectShow <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(effectShow))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `effect_show` = '%s' WHERE `id`=%s", 
        dbName, effectShow, sessionID))
} 
