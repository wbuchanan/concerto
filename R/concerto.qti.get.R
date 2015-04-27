#' @name concerto.qti.get 
#' @aliases concerto.qti.get 
#' @title Workspace name retrieval
#' @description Gets workspace name.
#' @param qtiID QTI ID Number
#' @param workspaceID Concerto workspace ID.
#' @return Name of the workspace.
#' @author Przemyslaw Lis
#' @import RMySQL
#' @examples \dontrun{
#' dbName <- concerto.workspace.get(1)
#' }
#' @export
#' 

concerto.qti.get <- function(qtiID, workspaceID = concerto$workspaceID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, 
				      concerto.workspace.get(workspaceID))
    objField <- "id"
    if (is.character(qtiID)) {
        objField <- "name"
    }
    
    qtiID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(qtiID))
    result <- RMySQL::dbSendQuery(concerto$db$connection, sprintf("SELECT `id`,`name`,`ini_r_code`,`response_proc_r_code` FROM `%s`.`QTIAssessmentItem` WHERE `%s`='%s'", 
        dbName, objField, qtiID))
    response <- RMySQL::fetch(result, n = -1)
    return(response)
} 
