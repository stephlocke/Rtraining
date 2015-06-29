library(shiny)
library(shinyAce)
boardpack<-read_file("MyBoardPack.Rmd")
#' Define UI for application that demonstrates a simple Ace editor
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyUI(
  bootstrapPage(
    textInput("TableD1","TableD1","blah"),
    textInput("ChartD1","ChartD1","meh"),
    textInput("TableD2","TableD2","huh"),
    textInput("ChartD2","ChartD2","wtf?"),
    downloadButton('report'),
            h2("Board pack preview (before commentary)"),
            htmlOutput("knitDoc")
        )
    )
