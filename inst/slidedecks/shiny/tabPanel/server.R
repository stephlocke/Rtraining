library(shiny)
library(data.table)

shinyServer(function(input, output) {
  source("webscraping.R")
  output$exceptions <- renderDataTable({
    sessionswithoutsubmissions[day >= input$ConfDays[1]& day <= input$ConfDays[2]
                               ,.(Date=day,
                                  Speaker=SessionSpeaker,
                                  Session=SessionTitle)][
                                    order(Date)]        
  }, options=list(pageLength=50))
  
  output$sessions<- renderDataTable({
    finaldataset[day >= input$ConfDays[1]& day <= input$ConfDays[2]
                 ,.(Date=day,
                    Speaker=SessionSpeaker,
                    Session=SessionTitle,
                    Level=SessionLevel,
                    Track= SessionTrack,
                    Abstract=SessionAbstract)][
                      order(Date)]            
  }, options=list(pageLength=50)) 
  
}) 
