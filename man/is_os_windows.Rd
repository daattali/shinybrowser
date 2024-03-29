% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_info.R
\name{is_os_windows}
\alias{is_os_windows}
\title{Is the user on Windows?}
\usage{
is_os_windows()
}
\value{
Whether or not this user using Windows
}
\description{
Convenience function that checks if the user's operating system is detected as Windows.
See \code{\link[=get_os]{get_os()}} for details.
}
\examples{
if (interactive()) {
  library(shiny)

  ui <- fluidPage(
    shinybrowser::detect(),
    "Are you on Windows?",
    textOutput("result")
  )
  server <- function(input, output, session) {
    output$result <- renderText({
      shinybrowser::is_os_windows()
    })
  }
  shinyApp(ui, server)
}
}
