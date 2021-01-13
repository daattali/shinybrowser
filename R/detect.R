#' Detect a user's browser information
#'
#' This function must be called somewhere in a Shiny app's UI in order to use any other
#' \{shinybrowser\} functions.
#'
#' @seealso [get_info()]
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Your browser information:",
#'     verbatimTextOutput("browser_info")
#'   )
#'   server <- function(input, output, session) {
#'     output$browser_info <- renderPrint({
#'       shinybrowser::get_info()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
detect <- function() {
  shiny::addResourcePath("shinybrowser-assets", system.file("assets", package = "shinybrowser"))
  shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(
        src = file.path("shinybrowser-assets", "srcjs", "shinybrowser.js")
      )
    )
  )
}
