#' @name concerto.initialize
#' @aliases concerto.initialize 
#' @title concerto.initialize
#' @description Undocumented function
#' @param testID ID field for test
#' @param sessionID ID field for the testing session
#' @param workspaceID ID field for the workspace
#' @param workspacePrefix Prefix to use for the workspace
#' @param user DB User Name
#' @param password DB Password for user
#' @param dbName Name of DB to connect to
#' @param host DB Host Address
#' @param port Port number for database
#' @param tempPath File path where temporary files will be stored
#' @param mediaPath File path to location where media files are stored
#' @param dbTimezone Value used to set time zone parameter of MySQL DB
#' @param dbConnect Database connection object
#' @param userIP IP address for the user
#' @param mediaURL URL specifying where the browser should access media files from
#' @author Przemyslaw Lis
#' @export
#' 

concerto.initialize <- function(testID, sessionID, workspaceID, workspacePrefix, 
				user, password, dbName, host = "localhost", 
    				port = 3306, tempPath, mediaPath, dbTimezone, 
				dbConnect, userIP, mediaURL) {
    print("initialization...")
    
    options(encoding = "UTF-8")
    concerto <<- list()
    concerto$testID <<- testID
    concerto$sessionID <<- sessionID
    concerto$workspaceID <<- workspaceID
    concerto$workspacePrefix <<- workspacePrefix
    concerto$templateFIFOPath <<- paste(tempPath, "/fifo_", sessionID, sep = "")
    concerto$sessionPath <<- paste(tempPath, "/session_", sessionID, ".Rs", sep = "")
    concerto$mediaPath <<- mediaPath
    concerto$userIP <<- userIP
    concerto$mediaURL <<- mediaURL
    
    setwd(tempPath)
    print(paste("working directory set to:", tempPath))
    
    if (dbConnect) concerto:::concerto.db.connect(user, password, dbName, host, port, dbTimezone)
    
} 
