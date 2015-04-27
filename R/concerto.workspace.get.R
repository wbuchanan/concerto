#' @name concerto.workspace.get
#' @aliases concerto.workspace.get 
#' @title concerto.workspace.get
#' @description Undocumented function
#' @param workspaceID ID field for the workspace
#' @author Przemyslaw Lis
#' @return Returns workspace name string
#' @export
#' 

concerto.workspace.get <- function(workspaceID) {
    if (!is.numeric(workspaceID)) {
        stop("workspaceID must be of numeric type")
    }
    
    return(paste(concerto$workspacePrefix, workspaceID, sep = ""))
} 
