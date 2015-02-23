library(shiny)
library(data.table)
setwd("~/Rtraining/slidedecks/shiny")

shinyServer(function(input, output) {
  load("webscrapingresults.RData")
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
