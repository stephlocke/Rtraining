library(ezknitr)
library(rmarkdown)
library(Rtraining)
slidedecks <- list.files(
  "inst/slidedecks",
  pattern = "*.Rmd",recursive = TRUE,full.names = TRUE
)

shinydecks<-list.files(
  "inst/slidedecks/shiny",
  pattern = "*.Rmd",recursive = TRUE,full.names = TRUE
)

workshops<-list.files(
  "inst/workshops",
  pattern = "*.Rmd",recursive = TRUE,full.names = TRUE
)
  
slidedecks<-slidedecks[-grep("subDocs|demo",slidedecks)]
workshops<-workshops[-grep("subDocs|demo",workshops)]
slidedecks<-setdiff(slidedecks,shinydecks)

for (f in slidedecks) render(f,output_dir = "out",output_format = Rtraining::stephRevealSlideStyle())
for (f in shinydecks) render(f,output_dir = "out",output_format = Rtraining::stephSlideStyle())
for (f in workshops) render(f, output_dir = "out")

handouts <- list.files(
  "inst/handouts/",
  pattern = "*.Rmd",recursive = TRUE,full.names = TRUE
)
handouts<-handouts
for (f in handouts) ezknit(f,out_dir = "out",keep_md = FALSE)

# index
render("inst/index.Rmd",output_dir = "out")
