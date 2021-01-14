#' Get all info
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
get_user_agent <- function() {
  get_shinybrowser_info()[["user_agent"]]
}

#' @export
is_device_mobile <- function() {
  get_device() == "Mobile"
}

#' @export
is_device_desktop <- function() {
  !is_mobile()
}

is_browser_ie <- function() {
  get_browser() == "Internet Explorer"
}

is_browser_chrome <- function() {
  get_browser() == "Chrome"
}

is_browser_firefox <- function() {
  get_browser() == "Firefox"
}

is_os_windows <- function() {
  get_os() == "Windows"
}

is_os_mac <- function() {
  get_os() == "Mac"
}

get_shinybrowser_info <- function() {
  session <- shiny::getDefaultReactiveDomain()$rootScope()
  req(session$input$.shinybrowser)
  session$input$.shinybrowser
}
