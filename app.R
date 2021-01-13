library(shiny)

name_UI <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns('mod'),"fMODf"),
    div(id="notinff", "NOT IN FF")
  )
}

name <- function(input, output, session) {
  observeEvent(input$mod,{
    message("MODULE")
  })
}

ui <- fluidPage(
  name_UI('mm'),
  detect(),
  #   uiOutput("gg"),
 actionButton("ff","g"),
 tags$script("alert(navigator.userAgent)"),
  verbatimTextOutput("aa")
)

server <- function(input, output, session) {
  callModule(name,'mm')
  observe(message(is_ie()))
  # observe({
  #   str(isie())
  # })
  # output$aa<-renderPrint(
  #   str(isie())
  # )
  # output$gg<-renderUI(detect())
  #observeEvent(input$shinybrowser, {message('here');str(input$shinybrowser);browser()})
#observeEvent(input$ff,{message('out');str(get_info())})
 #observeEvent(get_info(),{message('f'); str(get_info());message(get_device());message(is_ie())})
  #observe({message('fff');message(session$userData$shinybrowser())})
}

shinyApp(ui, server)
