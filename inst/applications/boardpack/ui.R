library(shiny)

shinyUI(
  bootstrapPage(
    textInput("TableD1","TableD1","blah"),
    textInput("ChartD1","ChartD1","meh"),
    textInput("TableD2","TableD2","huh"),
    textInput("ChartD2","ChartD2","wtf?"),
    downloadButton('report'),
            h2("Board pack preview"),
            htmlOutput("knitDoc")
        )
    )
