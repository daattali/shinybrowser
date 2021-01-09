#' @export
detect <- function() {
  shiny::addResourcePath("shinybrowser-assets", system.file("www", package = "shinybrowser"))
  shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(
        src = file.path("shinybrowser-assets", "srcjs", "shinybrowser.js")
      )
    )
  )
}
