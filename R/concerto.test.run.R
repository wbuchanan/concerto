#' @name concerto.test.run 
#' @aliases concerto.test.run 
#' @title Running Concerto test
#' @description Runs Concerto test.
#' @param testID Test ID or name.
#' @param params Named list of parameters you want to pass to the test logic.
#' @param workspaceID Concerto workspace ID where the test object is located.
#' @return Named list with the test specific return variables.
#' @author Przemyslaw Lis
#' @examples \dontrun{
#' test <- concerto.test.run(1)
#' }
#' @export
#' 

concerto.test.run <- function(testID, params = list(), workspaceID = concerto$workspaceID) {
    print(paste("running test #", workspaceID, ":", testID, "...", sep = ""))
    
    test <- concerto.test.get(testID, workspaceID = workspaceID)
    if (dim(test)[1] == 0) 
        stop(paste("Test #", workspaceID, ":", testID, " not found!", sep = ""))
    
    if (length(params) > 0) {
        for (param in ls(params)) {
            assign(param, params[[param]])
        }
    }
    
    eval(parse(text = test[1, "code"]))
    
    return <- list()
    for (ret in test$returnVariables) {
        if (exists(ret)) 
            return[[ret]] <- get(ret)
    }
    return(return)
} 
