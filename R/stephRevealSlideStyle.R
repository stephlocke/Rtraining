#' Doc template for presentations
#'
#' @param css  Stylesheet
#' @param ...  Other parameters for 
#' @param options Options to pass Reveal
#'
#' @export
#'
stephRevealSlideStyle<- function(css=NULL, options=NULL, ...) {
  if (is.null(css)) {
  # get the locations of resource files located within the package
  css <- system.file("style/Reveal.css", package = "Rtraining")
  } 
  
  if(is.null(options)){
    options<-list(
      width= 1200
      ,height= 800
      ,previewLinks= "true")
  }
  
  revealjs::revealjs_presentation(css = css, center = FALSE, reveal_options = options, ...)
}