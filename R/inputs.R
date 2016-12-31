#' Create a telephone number input control
#' 
#' Creates a input for telephone numbers, which is validated using the formance JavaScript Library
#' 
#' @export
#' @param inputId The input slot that will be used to access the value.
#' @param label Display the label for the control, or NULL for no label.
#' @param value Initial Value.
#' @param width The width of the input, e.g. '400px', or '100%';see \link[shiny]{validateCssUnit}
#' @param placeholder A character string giving the user a hint as to what can be entered into the control. Internet Explorer 8 and 9 do not support this option.
#' @import shiny
#' @return A phone input control that can be added to a UI definition.
#' @seealso \link[shiny]{textInput}

phoneInput <- function(inputId, label, value = "", width = NULL, placeholder = NULL, ...) 
{
  myInput("text",inputId, label, value, width, placeholder, class = "phone_number", ...)
}

#' @export
#' @rdname phoneInput
zipInput <- function(inputId, label, value = "", width = NULL, placeholder = NULL, ...) 
{
  myInput("text",inputId, label, value, width, placeholder, maxlength = "5",
          onkeypress='return event.charCode >= 48 && event.charCode <= 57', ...)
}

#' @export
#' @rdname phoneInput
myInput <- function(type, inputId, label, value = "", width = NULL, placeholder = NULL, class = "", ...) 
{
  value <- restoreInput(id = inputId, default = value)
  class <- paste0("form-control ",class)
  tagList(useFormancer(),
          div(class = "form-group shiny-input-container", style = if (!is.null(width)) 
            paste0("width: ", validateCssUnit(width), ";"), label %AND% 
              tags$label(label, `for` = inputId), tags$input(id = inputId, 
                                                             type = type, class = class, 
                                                             value = value, 
                                                             placeholder = placeholder,...)))
}

# copied from shiny
`%AND%` <- function (x, y) 
{
  if (!is.null(x) && !is.na(x)) 
    if (!is.null(y) && !is.na(y)) 
      return(y)
  return(NULL)
}