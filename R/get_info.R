#' Get all information about user's browser
#'
#' Get a list with all the information detected about the user's browser.\cr\cr
#' The list is reactive, therefore it must be accessed inside a reactive context
#' (such as an [observe][shiny::observe] or [reactive][shiny::reactive]).\cr\cr
#' \{shinybrowser\} must be initialized with a call to [detect()] in the app's ui.
#' @inheritSection detect Accuracy
#' @inheritSection detect Supported values
#' @inheritSection detect Mobile vs desktop vs tablet
#' @inheritSection detect Width and height
#' @seealso [detect()], [get_browser()], [get_browser_version()], [get_os()], [get_os_version()],
#' [get_device()], [get_width()], [get_height()], [get_user_agent()],
#' [SUPPORTED_BROWSERS], [SUPPORTED_DEVICES], [SUPPORTED_OPERATING_SYSTEMS]
#' @return List with all information detected about the user's browser: `device`, `browser`,
#' `os`, `dimensions`, `user_agent`
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
#'       shinybrowser::get_all_info()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
get_all_info <- function() {
  get_shinybrowser_info()
}

#' Get user's browser
#'
#' Get the user's browser name (such as "Chrome" or "Firefox") and version.\cr\cr
#' The value is reactive, therefore it must be accessed inside a reactive context
#' (such as an [observe][shiny::observe] or [reactive][shiny::reactive]).\cr\cr
#' \{shinybrowser\} must be initialized with a call to [detect()] in the app's ui.
#' @inheritSection detect Accuracy
#' @inheritSection detect Supported values
#' @seealso [detect()], [get_all_info()], [is_browser_ie()],
#' [is_browser_chrome()], [is_browser_firefox()], [SUPPORTED_BROWSERS]
#' @return User's detected browser type
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Your browser:",
#'     textOutput("browser_info")
#'   )
#'   server <- function(input, output, session) {
#'     output$browser_info <- renderText({
#'       paste(shinybrowser::get_browser(), "version", shinybrowser::get_browser_version())
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
get_browser <- function() {
  get_shinybrowser_info()[["browser"]][["name"]]
}

#' @rdname get_browser
#' @return User's detected browser version
#' @export
get_browser_version <- function() {
  get_shinybrowser_info()[["browser"]][["version"]]
}

#' Get user's operating system
#'
#' Get the user's operating system (such as "Windows" or "Mac" or "Android") and version
#' (such as "10" for Windows or "OS X" for Mac).\cr\cr
#' The value is reactive, therefore it must be accessed inside a reactive context
#' (such as an [observe][shiny::observe] or [reactive][shiny::reactive]).\cr\cr
#' \{shinybrowser\} must be initialized with a call to [detect()] in the app's ui.
#' @inheritSection detect Accuracy
#' @inheritSection detect Supported values
#' @seealso [detect()], [get_all_info()], [is_os_windows()],
#' [is_os_mac()], [SUPPORTED_OPERATING_SYSTEMS]
#' @return User's detected operating system
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Your operating system:",
#'     textOutput("os_info")
#'   )
#'   server <- function(input, output, session) {
#'     output$os_info <- renderText({
#'       paste(shinybrowser::get_os(), "version", shinybrowser::get_os_version())
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
get_os <- function() {
  get_shinybrowser_info()[["os"]][["name"]]
}

#' @rdname get_os
#' @return User's detected operating system version
#' @export
get_os_version <- function() {
  get_shinybrowser_info()[["os"]][["version"]]
}

#' Get user's device (mobile or desktop)
#'
#' The value is reactive, therefore it must be accessed inside a reactive context
#' (such as an [observe][shiny::observe] or [reactive][shiny::reactive]).\cr\cr
#' \{shinybrowser\} must be initialized with a call to [detect()] in the app's ui.
#' @inheritSection detect Accuracy
#' @inheritSection detect Mobile vs desktop vs tablet
#' @seealso [detect()], [get_all_info()], [is_device_mobile()], [is_device_desktop()],
#' [get_width()], [get_height()]
#' @return User's detected decive type ("Mobile" or "Desktop")
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Your device:",
#'     textOutput("device_info")
#'   )
#'   server <- function(input, output, session) {
#'     output$device_info <- renderText({
#'       shinybrowser::get_device()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
get_device <- function() {
  get_shinybrowser_info()[["device"]]
}

#' Get user's browser dimensions (in pixels)
#'
#' The value is reactive, therefore it must be accessed inside a reactive context
#' (such as an [observe][shiny::observe] or [reactive][shiny::reactive]).\cr\cr
#' \{shinybrowser\} must be initialized with a call to [detect()] in the app's ui.
#' @inheritSection detect Width and height
#' @seealso [detect()], [get_all_info()]
#' @return User's detected browser width in pixels
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Your browser dimensions:",
#'     textOutput("browser_dim")
#'   )
#'   server <- function(input, output, session) {
#'     output$browser_dim <- renderText({
#'       paste0(shinybrowser::get_width(), "x", shinybrowser::get_height())
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
get_width <- function() {
  get_shinybrowser_info()[["dimensions"]][["width"]]
}

#' @rdname get_width
#' @return User's detected browser height in pixels
#' @export
get_height <- function() {
  get_shinybrowser_info()[["dimensions"]][["height"]]
}

#' Get user agent string from the browser
#'
#' This function exposes the user agent that is reported by the browser, but it
#' should only be used for troubleshooting purposes.\cr\cr
#' The value is reactive, therefore it must be accessed inside a reactive context
#' (such as an [observe][shiny::observe] or [reactive][shiny::reactive]).\cr\cr
#' \{shinybrowser\} must be initialized with a call to [detect()] in the app's ui.
#' @seealso [detect()], [get_all_info()]
#' @return User's user-agent string
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Your user agent:",
#'     textOutput("ua_info")
#'   )
#'   server <- function(input, output, session) {
#'     output$ua_info <- renderText({
#'       shinybrowser::get_user_agent()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
get_user_agent <- function() {
  get_shinybrowser_info()[["user_agent"]]
}

#' Is the user on a mobile device?
#'
#' Convenience function that checks if the user's device is detected as mobile.
#' See [get_device()] for details.
#' @return Whether or not this user is on mobile
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you on mobile?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_device_mobile()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_device_mobile <- function() {
  get_device() == "Mobile"
}

#' Is the user on a desktop device?
#'
#' Convenience function that checks if the user's device is detected as desktop.
#' See [get_device()] for details.
#' @return Whether or not this user is on desktop
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you on desktop?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_device_desktop()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_device_desktop <- function() {
  !is_device_mobile()
}

#' Is the user using Internet Explorer?
#'
#' Convenience function that checks if the user's browser is detected as Internet Explorer.
#' See [get_browser()] for details.
#' @return Whether or not this user using Internet Explorer
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you using Internet Explorer?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_browser_ie()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_browser_ie <- function() {
  get_browser() == "Internet Explorer"
}

#' Is the user using Chrome?
#'
#' Convenience function that checks if the user's browser is detected as Chrome.
#' See [get_browser()] for details.
#' @return Whether or not this user using Chrome
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you using Chrome?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_browser_chrome()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_browser_chrome <- function() {
  get_browser() == "Chrome"
}

#' Is the user using Firefox?
#'
#' Convenience function that checks if the user's browser is detected as Firefox.
#' See [get_browser()] for details.
#' @return Whether or not this user using Firefox
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you using Firefox?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_browser_firefox()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_browser_firefox <- function() {
  get_browser() == "Firefox"
}

#' Is the user on Windows?
#'
#' Convenience function that checks if the user's operating system is detected as Windows.
#' See [get_os()] for details.
#' @return Whether or not this user using Windows
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you on Windows?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_os_windows()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_os_windows <- function() {
  get_os() == "Windows"
}

#' Is the user on Mac?
#'
#' Convenience function that checks if the user's operating system is detected as Mac.
#' See [get_os()] for details.
#' @return Whether or not this user using MacOS
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     shinybrowser::detect(),
#'     "Are you on Mac?",
#'     textOutput("result")
#'   )
#'   server <- function(input, output, session) {
#'     output$result <- renderText({
#'       shinybrowser::is_os_mac()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @export
is_os_mac <- function() {
  get_os() == "Mac"
}

get_shinybrowser_info <- function() {
  session <- shiny::getDefaultReactiveDomain()$rootScope()
  shiny::req(session$input$.shinybrowser)
  session$input$.shinybrowser
}
