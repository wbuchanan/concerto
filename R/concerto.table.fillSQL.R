#' @name concerto.table.fillSQL 
#' @aliases concerto.table.fillSQL
#' @title Table helper function.
#' @description Fills SQL code with given parameters.
#' @param sql SQL code.
#' @param params Named list with parameters.
#' @return SQL code with inserted parameters.
#' @author Przemyslaw Lis
#' @examples \dontrun{
#' id <- 123
#' sql <- "SELECT * FROM `db`.`table` WHERE `id`=  id_value  "
#' sql <- concerto.table.fillSQL(sql, list(id_value = id))
#' }
#' @import RMySQL
#' @export
#' 
 
concerto.table.fillSQL <- function(sql, params = list()) {
    matches <- unlist(regmatches(sql, gregexpr("\\{\\{[^\\}\\}]*\\}\\}", sql)))
    while (length(matches) > 0) {
        index <- 1
        while (index <= length(matches)) {
            name <- gsub("\\{\\{", "", matches[index])
            name <- gsub("\\}\\}", "", name)
            if (!is.null(params[[name]])) {
                value <- RMySQL::dbEscapeStrings(concerto$db$connection, 
						toString(params[[name]]))
                sql <- gsub(matches[index], value, sql, fixed = TRUE)
            } else {
                sql <- gsub(matches[index], "", sql, fixed = TRUE)
            }
            index = index + 1
        }
        matches <- unlist(regmatches(sql, gregexpr("\\{\\{[^\\}\\}]*\\}\\}", sql)))
    }
    return(sql)
} 
