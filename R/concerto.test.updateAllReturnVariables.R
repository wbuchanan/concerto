#' @name concerto.test.updateAllReturnVariables
#' @aliases concerto.test.updateAllReturnVariables
#' @title concerto.test.updateAllReturnVariables
#' @description Not clearly documented
#' @author Przemyslaw Lis
#' @export
#' 

concerto.test.updateAllReturnVariables <- function() {
    print("updating all return variables...")
    
    test <- concerto.test.get(concerto$testID)
    for (ret in test$returnVariables) {
    	concerto:::concerto.test.updateReturnVariable(ret)
    }
} 
