% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_info.R
\name{is_browser_chrome}
\alias{is_browser_chrome}
\title{Is the user using Chrome?}
\usage{
is_browser_chrome()
}
\value{
Whether or not this user using Chrome
}
\description{
Convenience function that checks if the user's browser is detected as Chrome.
See \code{\link[=get_browser]{get_browser()}} for details.
}
\examples{
if (interactive()) {
  library(shiny)

  ui <- fluidPage(
    shinybrowser::detect(),
    "Are you using Chrome?",
    textOutput("result")
  )
  server <- function(input, output, session) {
    output$result <- renderText({
      shinybrowser::is_browser_chrome()
    })
  }
  shinyApp(ui, server)
}
}
