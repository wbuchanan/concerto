#' @name concerto.template.get 
#' @aliases concerto.template.get
#' @title Template object retrieval
#' @description Gets template object.
#' @param templateID Template ID or name.
#' @param workspaceID Concerto workspace ID where template is located.
#' @return List with template object properties:
#' \itemize{
#' \item{id}{template object ID}
#' \item{name}{template object name} 
#' \item{head}{head tag contents} 
#' \item{HTML}{template HTML}
#' \item{effect_show}{template transition show effect}
#' \item{effect_show_options}{template transition show effect options}
#' \item{effect_hide}{template transition hide effect}
#' \item{effect_hide_options}{template transition hide effect options}
#' }
#' @author Przemyslaw Lis
#' @examples \dontrun{
#' template1 <- concerto.template.get(1)
#' template2 <- concerto.template.get("some_other_template")
#' }
#' @import RMySQL
#' @export
#'

concerto.template.get <- function(templateID, workspaceID = concerto$workspaceID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, 
				      concerto.workspace.get(workspaceID))
    
    objField <- "id"
    if (is.character(templateID)) {
        objField <- "name"
    }
    
    templateID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(templateID))
    result <- RMySQL::dbSendQuery(concerto$db$connection, sprintf("SELECT `id`,`name`,`head`,`HTML`,`effect_show`,`effect_show_options`,`effect_hide`,`effect_hide_options` FROM `%s`.`Template` WHERE `%s`='%s'", 
        dbName, objField, templateID))
    response <- RMySQL::fetch(result, n = -1)
    return(response)
} 

