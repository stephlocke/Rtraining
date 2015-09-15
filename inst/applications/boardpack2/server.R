############# Prep ################
library(shiny)
library(knitr)
if(!require(devtools)) install.packages("devtools",repos = "https://cran.rstudio.com")
if(!require(Rtraining)) devtools::install_github("stephlocke/Rtraining")
library("RSQLite")
db <- dbConnect(SQLite(), dbname="Boardpack.sqlite")


if(!dbExistsTable(db,"Comments")){
  emptyComments<-data.frame(Field=NA_character_,
                            Comment=NA_character_,
                            Date=NA_character_)
  dbWriteTable(db,name = "Comments" ,value=emptyComments)
  dbSendQuery(db,"DELETE FROM Comments")
}

shinyServer(function(input, output, session) {
  
  ############# Preview Functionality ################
  boardpreview<-  reactive(  readr::read_file(
    knit2html(input = "MyBoardPack.Rmd",output = "MyBoardPack.html"))
    )
  
  output$knitDoc <- renderUI({
    HTML(boardpreview() )
  })

  ############# Generate Functionality ################
  output$report = downloadHandler(
    filename <- paste0("MyBoardPack",format(Sys.Date(),"%Y%m%d"),".pdf"),
    
    content <- function(file) {
      out <- rmarkdown::render("MyBoardPack.Rmd", "pdf_document")
      file.rename(out, file) # move pdf to file for downloading
    },
    
    contentType = 'application/pdf'
  )
  
  ############# DB Functionality ################
  comments<- reactive({
    time<-Sys.time()
    
    data <- data.frame(
      Field= c("TableD1","ChartD1","TableD2","ChartD2"),
      Comment=c(input$TableD1,input$ChartD1,
                input$TableD2,input$ChartD2),
      Date=format(time))
    
    data
  })
  
  observeEvent(input$save,{
    dbWriteTable(db,name = "Comments" ,value=comments(), append=TRUE)
  })  
  
  output$previouscomments<-renderTable({
    input$save
    
    dbReadTable(db,"Comments")
  })
})