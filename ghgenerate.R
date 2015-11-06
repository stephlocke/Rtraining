slidedecks<-list.files("../Rtraining/inst/slidedecks/", 
                       pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
for(f in slidedecks) rmarkdown::render(f, output_format="ioslides_presentation",
                                       output_dir="out",quiet=TRUE)
devtools::install_version("DiagrammeR","0.7","http://cran.rstudio.com")
handouts<-list.files("../Rtraining/inst/handouts/",
                     pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
handouts<-handouts[-grep("(javascript|frontmatter)",x=handouts)]
for(f in handouts) rmarkdown::render(f, output_format="html_document",
                                     output_dir="out")

