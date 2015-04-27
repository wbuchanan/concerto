#' @name concerto.updateLoaderTemplateWorkspaceID
#' @aliases concerto.updateLoaderTemplateWorkspaceID
#' @title concerto.updateLoaderTemplateWorkspaceID
#' @description Set method for loader template workspace ID object
#' @param workspaceID ID field for the workspace
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateLoaderTemplateWorkspaceID <- function(workspaceID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    workspaceID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(workspaceID))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `loader_UserWorkspace_id` = '%s' WHERE `id`=%s", 
        dbName, workspaceID, sessionID))
} 
