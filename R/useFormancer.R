#' Include Formance JavaScript Library
#' 
#' Adds JavaScript code from Formance library to Shiny application
#' @importFrom shiny singleton includeScript tagList
#' @return Returns JavaScript files needed to use Formance in Shiny
#' @export

useFormancer <- function() {
  
  file_path1 <- system.file(package = "formancer",
                           "javascript/formance/jquery.formance.min.js")
  file_path2 <- system.file(package = "formancer",
                            "javascript/formancer.js")
  
  return(
      shiny::singleton(
        shiny::tagList(
        shiny::includeScript(file_path1),
        shiny::includeScript(file_path2)
        )
      )
  )
}