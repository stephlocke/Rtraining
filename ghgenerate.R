setwd("../out")
message(getwd())
message(list.files("../Rtraining" ,recursive = TRUE))
slidedecks<-list.files("../Rtraining/inst/slidedecks/", 
                       pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
for(f in slidedecks) rmarkdown::render(f, output_format="io_slides",
                                       output_dir=".")

handouts<-list.files("../Rtraining/inst/handouts/",
                     pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
for(f in handouts) rmarkdown::render(f, output_format="html_documents",
                                     output_dir=".")
