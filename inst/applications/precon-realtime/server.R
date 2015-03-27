library(shiny)
library(httr)
library(jsonlite)
function(input, output, session) {
  output$uppercase <- renderText({
    toJSON(x=list(ip=session$clientData$url_hostname,
                  breakstatus=input$breakstatus,
                  complexity=input$complexity)
    )
  })
}