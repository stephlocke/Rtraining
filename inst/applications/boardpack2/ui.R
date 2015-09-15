library(shiny)

textarea<-function(id) gsub(pattern="BLAH",x='<textarea id="BLAH" rows="3" cols="50">BLAH</textarea><br>',replacement=id)

shinyUI(
  bootstrapPage(
    h1("Monthly board pack"),
    h2("Add commentary here"),
    HTML(textarea("TableD1")) ,
    HTML(textarea("ChartD1")) ,
    HTML(textarea("TableD2")) ,
    HTML(textarea("ChartD2")) ,
    tabsetPanel(
      tabPanel("Preview the board pack", 
               htmlOutput("knitDoc")),
      tabPanel("Download the board pack", 
               downloadButton('report')),
      tabPanel("View saved comments", 
               actionButton("save", "Save current comments"),
               tableOutput("previouscomments"))
    )
 
  )
)
