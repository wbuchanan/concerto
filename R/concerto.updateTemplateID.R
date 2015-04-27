#' @name concerto.updateTemplateID
#' @aliases concerto.updateTemplateID
#' @title concerto.updateTemplateID
#' @description Set method for template ID object
#' @param templateID ID field for the assessment template to use
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.updateTemplateID <- function(templateID) {
    dbName <- RMySQL::dbEscapeStrings(concerto$db$connection, concerto$db$name)
    sessionID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(concerto$sessionID))
    templateID <- RMySQL::dbEscapeStrings(concerto$db$connection, toString(templateID))
    RMySQL::dbSendQuery(concerto$db$connection, statement = 
	sprintf("UPDATE `%s`.`TestSession` SET `Template_id` = '%s' WHERE `id`=%s", 
        dbName, templateID, sessionID))
} 
