context("Formats")
library(rmarkdown)


test_that("formats successfully produce a document", {
  
testFormat <- function(output_format) {
  output_file <- tempfile()
  capture.output(render("example.Rmd",
                        output_format = output_format,
                        output_file = output_file))
  expect_true(file.exists(output_file))
  output_file
}

testFormat(stephSlideStyle())
testFormat(stephPDFSlideStyle())
testFormat(stephRevealSlideStyle())


})