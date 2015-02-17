library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = "bootstrap.css",
                  tags$head(
                    tags$link(rel = "stylesheet", type = "text/css", href = "sqlbits.css")
                  ),
                  
  titlePanel("SQLBits - unregistered superheroes"),
  h3( "Sessions that do not appear on the submissions list"),

  sidebarLayout(
    sidebarPanel(
      dateRangeInput("ConfDays", "Show days", "2015-03-03", "2015-03-07" )
    ),

    mainPanel(
      dataTableOutput("exceptions")
    )
  )
))
