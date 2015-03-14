
# This is the server logic for a Shiny web application.  You can find out more about building applications with Shiny here:
# http://shiny.rstudio.com

library(shiny)
library(data.table)
shinyServer(function(input, output) {
  load("../webscrapingresults.RData")
    output$exceptions <- renderDataTable({
        sessionswithoutsubmissions[day >= input$ConfDays[1]& day <= input$ConfDays[2]
                                   ,.(Date=day,
                                      Speaker=SessionSpeaker,
                                      Session=SessionTitle)][
                                      order(Date)]        
    }, options=list(pageLength=50))
    
}) 
