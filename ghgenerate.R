slidedecks<-list.files(system.file("slidedecks",package = "Rtraining"), 
                       pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
for(f in slidedecks) rmarkdown::render(f, output_format="io_slides",
                                       output_dir="inst/doc")

handouts<-list.files(system.file("handouts",package = "Rtraining"),
                     pattern = "*.Rmd",recursive = TRUE,full.names = TRUE)
for(f in handouts) rmarkdown::render(f, output_format="html_documents",
                                     output_dir="inst/doc")
