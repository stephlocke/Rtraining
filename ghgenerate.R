library(ezknitr)
library(rmarkdown)
library(Rtraining)
slidedecks <- list.files(
  "inst/slidedecks/",
  pattern = "*.Rmd",recursive = TRUE,full.names = TRUE
)
slidedecks<-slidedecks[-grep("subDocs|demo",slidedecks)]
for (f in slidedecks) render(f,output_dir = "out")

handouts <- list.files(
  "inst/handouts/",
  pattern = "*.Rmd",recursive = TRUE,full.names = TRUE
)
for (f in handouts) ezknit(f,out_dir = "out",keep_md = FALSE)