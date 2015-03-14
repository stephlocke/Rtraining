library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("cerulean"),
  
  titlePanel("SQLBits"),
  
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("ConfDays", "Show days", "2015-03-03", "2015-03-07" )
    ),
    
    tabsetPanel(
      tabPanel("Superheroes, assemble!",
               dataTableOutput("sessions")
      ),
      
      tabPanel("Unregistered superheroes",
               h3( "Sessions that do not appear on the submissions list"),
               dataTableOutput("exceptions")
      )
      
    )
  )
))
