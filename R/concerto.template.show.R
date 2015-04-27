#' @name concerto.template.show 
#' @aliases concerto.template.show
#' @title Show template to test participant.
#' @description Display template to test participant.
#' @param templateID  Template ID or name.
#' @param HTML Template HTML.
#' @param head  Template head tag.
#' @param params  Named list with parameters we want to be inserted into template HTML.
#' @param timeLimit Time limit after which template will be auto submitted (in seconds).
#' @param finalize  Logical: TRUE if after this template there is no more logic available.
#' @param workspaceID Concerto workspace ID where template object is located.
#' @param effectShow  Template show transition effect.
#' @param effectHide  Template hide transition effect.
#' @param effectShowOptions  Template show transition effect options list.
#' @param effectHideOptions  Template hide transition effect options list.
#' @return Returns a named list with template specific input gathered from user and static variables:
#' \itemize{
#' \item{LAST_PRESSED_BUTTON_NAME}{character: name of the button that submitted the template}
#' \item{OUT_OF_TIME}{numeric: 1 if time limit has been reached and 0 if it hasn't}
#' \item{TIME_TAKEN}{numeric: time taken to submit the template}
#' }
#' @author Przemyslaw Lis
#' @examples \dontrun{
#' response1 <- concerto.template.show(1)
#' response2 <- concerto.template.show(HTML='<div align='center'>Hello world!</div>')
#' }
#' @export
#' 

 
concerto.template.show <- function(templateID = -1, HTML = "", head = "", params = list(),
				   timeLimit = 0, finalize = FALSE, 
				   workspaceID = concerto$workspaceID, effectShow = "default",
				   effectShowOptions = "default", effectHide = "default",
				   effectHideOptions = "default") {
    
    print(paste("showing template #", workspaceID, ":", templateID, "...", sep = ""))
    if (!is.list(params)) 
        stop("'params' must be a list!")
    
    if (templateID == -1 && HTML == "") 
        stop("templateID or HTML must be declared")
    
    template <- concerto.template.get(templateID, workspaceID = workspaceID)
    if (HTML != "") {
    	concerto:::concerto.updateHead(concerto.template.fillHTML(head, params))
    	concerto:::concerto.updateHTML(concerto.template.fillHTML(HTML, params))
    } else {
        if (dim(template)[1] == 0) 
            stop(paste("Template #", workspaceID, ":", templateID, " not found!", sep = ""))
    	concerto:::concerto.updateHead(concerto.template.fillHTML(template[1, "head"], params))
    	concerto:::concerto.updateHTML(concerto.template.fillHTML(template[1, "HTML"], params))
    }
    concerto:::concerto.updateTemplateWorkspaceID(workspaceID)
    concerto:::concerto.updateTemplateID(templateID)
    concerto:::concerto.updateTimeLimit(timeLimit)
    
    if (effectShow == "default") {
        if (dim(template)[1] > 0) 
            effectShow <- template[1, "effect_show"] else effectShow <- "none"
    }
    if (effectHide == "default") {
        if (dim(template)[1] > 0) 
            effectHide <- template[1, "effect_hide"] else effectHide <- "none"
    }
    if (effectShowOptions == "default") {
        if (dim(template)[1] > 0) 
            effectShowOptions <- template[1, "effect_show_options"] else effectShowOptions <- ""
    }
    if (effectHideOptions == "default") {
        if (dim(template)[1] > 0) 
            effectHideOptions <- template[1, "effect_hide_options"] else effectHideOptions <- ""
    }
    
    concerto:::concerto.updateEffectShow(effectShow)
    concerto:::concerto.updateEffectHide(effectHide)
    concerto:::concerto.updateEffectShowOptions(effectShowOptions)
    concerto:::concerto.updateEffectHideOptions(effectHideOptions)
    
    if (finalize) {
    	concerto:::concerto.test.updateAllReturnVariables()
    	concerto:::concerto.updateRelease(1)
    }
    
    concerto:::concerto.updateStatus(2)
    
    return(concerto:::concerto.interpretResponse())
    
} 
