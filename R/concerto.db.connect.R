#' @name concerto.db.connect
#' @aliases concerto.db.connect 
#' @title concerto.db.connect
#' @description Undocumented function
#' @param user DB User Name
#' @param password DB Password for user
#' @param dbName Name of DB to connect to
#' @param host DB Host Address
#' @param port Port number for database
#' @param dbTimezone Value used to set time zone parameter of MySQL DB
#' @author Przemyslaw Lis
#' @import RMySQL
#' @import DBI
#' @export
#' 

concerto.db.connect <- function(user, password, dbName, host = "localhost", port = 3306, dbTimezone) {
    print("connecting to database...")
    
    drv <- DBI::dbDriver("MySQL")
    
    con <- RMySQL::dbConnect(drv, user = user, password = password, dbname = dbName, host = host, 
    						 port = port, client.flag = RMySQL::CLIENT_MULTI_STATEMENTS)
    RMySQL::dbSendQuery(con, statement = "SET NAMES 'utf8';")
    RMySQL::dbSendQuery(con, statement = paste("SET time_zone='", dbTimezone, "';", sep = ""))
    
    concerto$db$connection <<- con
    concerto$db$name <<- dbName
    
} 
