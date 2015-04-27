#' @name concerto.test.updateReturnVariable
#' @aliases concerto.test.updateReturnVariable
#' @title concerto.test.updateReturnVariable
#' @description Not clearly documented
#' @param variable Not clearly documented
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.test.updateReturnVariable <- function(variable) {
    if (exists(variable)) {
        dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
        sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, 
					     toString(concerto$sessionID))
        value <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(get(variable)))
        variable <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(variable))
        value <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(value))
        RMySQL::dbSendQuery(concerto$db$connection, statement = 
		sprintf("REPLACE INTO `%s`.`TestSessionReturn` SET `TestSession_id` ='%s', `name`='%s', `value`='%s'", 
            	dbName, sessionID, variable, value))
    }
} 
