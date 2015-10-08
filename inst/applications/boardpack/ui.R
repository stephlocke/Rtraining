library(shiny)

shinyUI(
  bootstrapPage(
    h1("Monthly board pack"),
    h2("Add commentary here"),
    HTML('<textarea id="TableD1" rows="3" cols="50">TableD1</textarea><br>')   ,
    HTML('<textarea id="ChartD1" rows="3" cols="50">ChartD1</textarea><br>')   ,
    HTML('<textarea id="TableD2" rows="3" cols="50">TableD2</textarea><br>')   ,
    HTML('<textarea id="ChartD2" rows="3" cols="50">ChartD2</textarea><br>')   ,
    h2("Download the PDF when you're happy"),
    downloadButton('report'),
    h2("Preview the Board pack"),    
    htmlOutput("knitDoc")
  )
)
