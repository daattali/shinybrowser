#' Detect a user's browser information
#'
#' This function must be called somewhere in a Shiny app's UI in order to use any other
#' \{shinybrowser\} functions.
#' @section Accuracy:
#' It's important to understand there is no reliable way to detect the
#' information in \{shinybrowser\} with 100% accuracy.\cr\cr\{shinybrowser\} makes
#' a best effort at identifying the most accurate information, but some
#' browser/operating system combinations may be difficult to identify. Users
#' can also use a variety of tools to deliberately spoof this information.\cr\cr
#' With that in mind, \{shinybrowser\} should detect the correct information in
#' most cases.
#' @section Supported values:
#' Only major browsers and operating systems are supported, which means that the
#' RStudio Viewer may result in an "UNKNOWN" browser, and unpopular operating systems
#' may also result in "UNKNOWN".\cr\cr
#' For a list of values that can be detected, see [SUPPORTED_BROWSERS],
#' [SUPPORTED_DEVICES], and [SUPPORTED_OPERATING_SYSTEMS].
#' @section Mobile vs desktop vs tablet:
#' \{shinybrowser\} attempts to detect whether a device is "mobile" or "desktop".
#' The distinction between mobile and desktop is not always clear, so if what you
#' actually care about is the size of the device, it might be better to use
#' [get_width()].\cr\cr
#' Tablets return ambiguous results; some tablets self-report as mobile devices while
#' others as desktop.
#' @section Width and height:
#' The width and height of the browser window are only reported once, when the [detect()]
#' function is initially called.
#' If the user resizes the browser window, the new dimensions are not reported until
#' the page is refreshed.
#' @seealso [get_info()], [get_browser()], [get_os()], [get_device()], [get_width()]
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
