#' @name concerto.table.get 
#' @aliases concerto.table.get
#' @title Table object retrieval
#' @description Gets table object.
#' @param tableID Table object ID or name.
#' @param workspaceID Concerto workspace ID where the table object is located.
#' @return List with table object properties:
#' \itemize{
#' \item{id}{table object ID}
#' \item{name}{table object name} 
#' }
#' @author Przemyslaw Lis
#' @import RMySQL
#' @examples \dontrun{
#' table1 <- concerto.table.get(1)
#' table2 <- concerto.table.get("some_other_table")
#' }
#' @export
#' 

concerto.table.get <- function(tableID, workspaceID = concerto$workspaceID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, 
					concerto.workspace.get(workspaceID)) 
    objField <- "id"
    if (is.character(tableID)) {
        objField <- "name"
    }
    tableID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(tableID))
    result <- RMySQL::dbSendQuery(concerto$db$connection, 
		sprintf("SELECT `id`,`name` FROM `%s`.`Table` WHERE `%s`='%s'", dbName, 
        	objField, tableID))  
    response <- RMySQL::fetch(result, n = -1)
    return(response)
} 
