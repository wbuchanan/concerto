#' @name concerto.updateState
#' @aliases concerto.updateState
#' @title concerto.updateState
#' @description Set method for test session state
#' @author Przemyslaw Lis
#' @import RMySQL
#' @import rjson
#' @export
#' 

concerto.updateState <- function() {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    state <- list()
    for (var in ls(envir = .GlobalEnv)) {
        try({
            if (!is.function(get(var))) 
                state[[var]] <- toString(get(var))
            if (nchar(state[[var]]) > 100) 
                state[[var]] <- paste(substr(state[[var]], 0, 100), "...", sep = "")
        }, silent = T)
    }
    state <- rjson::toJSON(state)
    state <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(state))
    result <- RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `state` = '%s' WHERE `id`=%s", 
        dbName, state, sessionID))
} 
