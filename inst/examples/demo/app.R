library(shiny)
library(shinybrowser)

share <- list(
  title = "{shinybrowser}",
  url = "https://daattali.com/shiny/shinybrowser-demo/",
  source = "https://github.com/daattali/shinybrowser",
  image = "https://daattali.com/shiny/img/shinybrowser.png",
  description = "Find out information about a user's web browser in Shiny apps",
  twitter_user = "daattali"
)

ui <- fluidPage(
  shinydisconnect::disconnectMessage2(),
  detect(),
  title = paste0("{shinybrowser} ", as.character(packageVersion("shinybrowser"))),

  tags$head(
    tags$link(rel = "stylesheet", href = "style.css"),
    # Favicon
    tags$link(rel = "shortcut icon", type="image/x-icon", href="https://daattali.com/shiny/img/favicon.ico"),
    # Facebook OpenGraph tags
    tags$meta(property = "og:title", content = share$title),
    tags$meta(property = "og:type", content = "website"),
    tags$meta(property = "og:url", content = share$url),
    tags$meta(property = "og:image", content = share$image),
    tags$meta(property = "og:description", content = share$description),

    # Twitter summary cards
    tags$meta(name = "twitter:card", content = "summary"),
    tags$meta(name = "twitter:site", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:creator", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:title", content = share$title),
    tags$meta(name = "twitter:description", content = share$description),
    tags$meta(name = "twitter:image", content = share$image)
  ),

  div(
    id = "header",
    div(id = "pagetitle", share$title),
    div(id = "subtitle", share$description),
    div(
      id = "subsubtitle",
      "Created by",
      tags$a(href = "https://deanattali.com/", "Dean Attali"),
      HTML("&bull;"),
      "Available",
      tags$a(href = share$source, "on GitHub"),
      HTML("&bull;"),
      tags$a(href = "https://daattali.com/shiny/", "More apps"), "by Dean"
    )
  ),

  div(
    id = "sections",
    div(
      class = "section",
      div(class = "section_title", "Your browser"),
      div(
        class = "section_param",
        div(class = "section_value",
            "Name:",
            textOutput("browser_name", inline = TRUE)),
        tags$code("shinybrowser::get_browser()")
      ),
      div(
        class = "section_param",
        div(class = "section_value",
            "Version:",
            textOutput("browser_version", inline = TRUE)),
        tags$code("shinybrowser::get_browser_version()")
      )
    ),
    div(
      class = "section",
      div(class = "section_title", "Operating system"),
      div(
        class = "section_param",
        div(class = "section_value",
            "Name:",
            textOutput("os_name", inline = TRUE)),
        tags$code("shinybrowser::get_os()")
      ),
      div(
        class = "section_param",
        div(class = "section_value",
            "Version:",
            textOutput("os_version", inline = TRUE)),
        tags$code("shinybrowser::get_os_version()")
      )
    ),
    div(
      class = "section",
      div(class = "section_title", "Browser dimensions"),
      div(
        class = "section_param",
        div(class = "section_value",
            "Width:",
            textOutput("width", inline = TRUE)),
        tags$code("shinybrowser::get_width()")
      ),
      div(
        class = "section_param",
        div(class = "section_value",
            "Height:",
            textOutput("height", inline = TRUE)),
        tags$code("shinybrowser::get_height()")
      )
    ),
    div(
      class = "section",
      div(class = "section_title", "Misc"),
      div(
        class = "section_param",
        div(class = "section_value",
            "Mobile or desktop?",
            textOutput("device", inline = TRUE)),
        tags$code("shinybrowser::get_device()")
      ),
      div(
        class = "section_param",
        div(class = "section_value",
            "Full user agent:",
            uiOutput("useragent_section", inline = TRUE)),
        tags$code("shinybrowser::get_user_agent()")
      )
    )
  ),
  div(
    id = "help",
    "To access these values in a Shiny app, simply call", tags$code("shinybrowser::detect()"), "anywhere in the UI"
  )
)

server <- function(input, output, session) {
  output$browser_name <- renderText({
    get_browser()
  })
  output$browser_version <- renderText({
    get_browser_version()
  })
  output$os_name <- renderText({
    get_os()
  })
  output$os_version <- renderText({
    get_os_version()
  })
  output$width <- renderText({
    paste0(get_width(), "px")
  })
  output$height <- renderText({
    paste0(get_height(), "px")
  })
  output$device <- renderText({
    get_device()
  })
  output$ua <- renderText({
    get_user_agent()
  })

  output$useragent_section <- renderUI({
    if (is.null(input$show_ua) || input$show_ua == 0) {
      actionButton("show_ua", "Show", class = "btn-xs")
    } else {
      textOutput("ua", inline = TRUE)
    }
  })
}

shinyApp(ui, server)
