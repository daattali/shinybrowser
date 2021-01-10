# .onLoad <- function(libname, pkgname) {
#   shiny::registerInputHandler("shinybrowser", function(data, session, name) {
#     session$userData$shinybrowser <- data
#     data
#   }, force = TRUE)
# }
#
# .onUnload <- function(libpath) {
#   shiny::removeInputHandler("shinybrowser")
# }

get_shinybrowser_info <- function() {
  session <- shiny::getDefaultReactiveDomain()$rootScope()
  req(session$input$.shinybrowser)
  session$input$.shinybrowser
}

#' @export
get_info <- function() {
  get_shinybrowser_info()
}

#' @export
get_browser <- function() {
  get_shinybrowser_info()[["browser"]][["name"]]
}

#' @export
get_browser_version <- function() {
  get_shinybrowser_info()[["browser"]][["version"]]
}

#' @export
get_os <- function() {
  get_shinybrowser_info()[["os"]][["name"]]
}

#' @export
get_os_version <- function() {
  get_shinybrowser_info()[["os"]][["version"]]
}

#' The only distinction is between mobile and desktop. If the user is on a tablet,
#' the results are ambiguous; some tablets report as "Mobile" while some tablets
#' report as "Desktop". look at width
#' @export
get_device <- function() {
  get_shinybrowser_info()[["device"]]
}

#' @export
get_width <- function() {
  get_shinybrowser_info()[["dimensions"]][["width"]]
}

#' @export
get_height <- function() {
  get_shinybrowser_info()[["dimensions"]][["height"]]
}

#' @export
is_mobile <- function() {
  get_shinybrowser_info()[["device"]] == "Mobile"
}

#' @export
is_ie <- function() {
  get_shinybrowser_info()[["browser"]][["name"]] == "Internet Explorer"
}

#' Devices that can be detected with \{shinybrowser\}
#' @format NULL
#' @usage NULL
#' @export
SUPPORTED_DEVICES <- c("Mobile", "Desktop")

#' Browsers that can be detected with \{shinybrowser\}
#' @format NULL
#' @usage NULL
#' @export
SUPPORTED_BROWSERS <- c("Firefox", "Chrome", "Edge", "Safari", "Opera", "Internet Explorer", "UNKNOWN")

#' Operating systems that can be detected with \{shinybrowser\}
#' @format NULL
#' @usage NULL
#' @export
SUPPORTED_OPERATING_SYSTEMS <- c("Windows", "Mac", "Linux", "iOS", "Android", "BlackBerry", "Windows Phone", "UNKNOWN")
