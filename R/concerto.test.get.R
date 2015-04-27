#' @name concerto.test.get 
#' @aliases concerto, test.get
#' @title Test object retrieval
#' @description Gets template object.
#' @param testID Test ID or name.
#' @param workspaceID Concerto workspace ID where test object is located.
#' @return List with test object properties:
#' \itemize{
#' \item{id}{test object ID}
#' \item{name}{test object name}
#' \item{code}{test logic R code}
#' }
#' @author Przemyslaw Lis
#' @examples \dontrun{
#' test1 <- concerto.test.get(1)
#' test2 <- concerto.test.get("some_other_test")
#' }
#' @import RMySQL
#' @export
#'  

concerto.test.get <- function(testID, workspaceID = concerto$workspaceID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, 
			concerto.workspace.get(workspaceID))
    
    objField <- "id"
    if (is.character(testID)) {
        objField <- "name"
    }
    
    testID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(testID))
    result <- RMySQL::dbSendQuery(concerto$db$connection, 
		sprintf("SELECT `id`,`name`,`code` FROM `%s`.`Test` WHERE `%s`='%s'", 
        	dbName, objField, testID))
    response <- RMySQL::fetch(result, n = -1)
    response$returnVariables <- concerto:::concerto.test.getReturnVariables(testID, 
							workspaceID = workspaceID)
    return(response)
} 
