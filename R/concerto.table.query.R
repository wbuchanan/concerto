#' @name concerto.table.query 
#' @aliases concerto.table.query
#' @title Table query
#' @description Perform query on Concerto table.
#' @param sql SQL query to perform.
#' @param params Named list with parameters.
#' @details Contains extended function wizard with SQL query builder when used in Concerto platform.
#' @return Returns result set.
#' @author Przemyslaw Lis
#' @import RMySQL
#' @export
#' 

concerto.table.query <- function(sql, params = list()) {
    sql <- gsub("^[[:space:]]*", "", sql)
    sql <- concerto.table.fillSQL(sql, params)
    result <- RMySQL::dbSendQuery(concerto$db$connection, sql)
    
    if (tolower(substr(gsub("^[[:space:]]*", "", sql), 1, 6)) == "select") {
        response <- RMySQL::fetch(result, n = -1)
        return(response)
    }
    return(NULL)
} 
