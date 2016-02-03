#' Doc template for presentations
#'
#' @param template Which template to use
#' @param pandoc_args Any additional pandoc arguments (in a list)
#' @param ... Arguments for `rmarkdown::beamer_presentation`
#'
#' @export
#'
stephPDFSlideStyle<- function( template=NULL,
                              pandoc_args=NULL, ...) {
  
  
#   if (is.null(theme)) {
#   theme <- file.path(system.file("style", package = "Rtraining"),
#                      "beamerthemem")
#   } 
  if (is.null(template)) {
    template <- system.file("style/default.tex", package = "Rtraining")
  } 
  if (is.null(pandoc_args)) {
    pandoc_args <- list("--latex-engine=xelatex")
  }
  
  rmarkdown::beamer_presentation(template=template,
                                 pandoc_args=pandoc_args,...)
}