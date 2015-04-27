#' @name template 
#' @aliases concerto.template.fillHTML
#' @title Template helper function.
#' @description Fills template HTML with given parameters.
#' @param html HTML template.
#' @param params Named list with parameters.
#' @return HTML with inserted parameters.
#' @author Przemyslaw Lis
#' @examples \dontrun{
#' html <- "<html><body>Inserted variable:   param1  </body></html>"
#' html <- concerto.template.fillHTML(html, list(param1 = "value"))
#' }
#' @export
#' 

concerto.template.fillHTML <- function(html, params = list()) {
    matches <- unlist(regmatches(html, gregexpr("\\{\\{[^\\}\\}]*\\}\\}", html)))
    matches <- matches[!matches == "{{TIME_LEFT}}"]
    while (length(matches) > 0) {
        index <- 1
        while (index <= length(matches)) {
            value <- gsub("\\{\\{", "", matches[index])
            value <- gsub("\\}\\}", "", value)
            if (!is.null(params[[value]])) {
                html <- gsub(matches[index], toString(params[[value]]), html, fixed = TRUE)
            } else {
                html <- gsub(matches[index], "", html, fixed = TRUE)
            }
            index = index + 1
        }
        matches <- unlist(regmatches(html, gregexpr("\\{\\{[^\\}\\}]*\\}\\}", html)))
        matches <- matches[!matches == "{{TIME_LEFT}}"]
    }
    return(html)
} 

