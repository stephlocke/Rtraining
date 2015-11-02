setwd("../out")
message(getwd())
message(list.files("../Rtraining" ,recursive = TRUE))
slidedecks<-list.files("../Rtraining/inst/slidedecks/", 
                       pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
for(f in slidedecks) rmarkdown::render(f, output_format="ioslides_presentation",
                                       output_dir=".",quiet=TRUE)

handouts<-list.files("../Rtraining/inst/handouts/",
                     pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
handouts<-handouts[-grep("(javascript|frontmatter|windows)",x=handouts)]
for(f in handouts) rmarkdown::render(f, output_format="html_document",
                                     output_dir=".",quiet=TRUE)

