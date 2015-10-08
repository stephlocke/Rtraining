library(shiny)
library(knitr)
if(!require(devtools)) install.packages("devtools",repos = "https://cran.rstudio.com")
if(!require(Rtraining)) devtools::install_github("stephlocke/Rtraining")

shinyServer(function(input, output, session) {
  
  boardpreview<-  reactive(  readr::read_file(
      knit2html(input = "MyBoardPack.Rmd",output = "MyBoardPack.html")))
  
  
  
  output$knitDoc <- renderUI({
    HTML(boardpreview() )
  })
  
  output$report = downloadHandler(
    filename <- paste0("MyBoardPack",format(Sys.Date(),"%Y%m%d"),".pdf"),
    
    content <- function(file) {
      out <- rmarkdown::render("MyBoardPack.Rmd", "pdf_document")
      file.rename(out, file) # move pdf to file for downloading
    },
    
    contentType = 'application/pdf'
  )
})