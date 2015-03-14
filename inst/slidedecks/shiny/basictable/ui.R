library(shiny)

shinyUI(fluidPage(

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
