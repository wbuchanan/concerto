#' @name concerto.test.getReturnVariables
#' @aliases concerto.test.getReturnVariables
#' @title concerto.test.getReturnVariables
#' @description Accessor method for return variables
#' @param testID ID for the assessment
#' @param workspaceID ID for the workspace
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.test.getReturnVariables <- function(testID, workspaceID = concerto$workspaceID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, 
				      concerto.workspace.get(workspaceID))
    
    objField <- "id"
    if (is.character(testID)) {
        objField <- "name"
    }
    
    testID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(testID))
    result <- RMySQL::dbSendQuery(concerto$db$connection, 
		sprintf("SELECT `name` FROM `%s`.`TestVariable` WHERE `%s`='%s' AND `type`=1", 
        	dbName, objField, testID))
    response <- RMySQL::fetch(result, n = -1)
    
    result <- c()
    for (i in dim(response)[1]) {
        result <- c(result, response[i, "name"])
    }
    return(result)
} 
