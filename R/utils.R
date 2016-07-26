#' Produce link to file stored on github repo
#'
#' @param x file name
#' @param repo username/repo
#' @param branch If in gh-pages or something
#'
#' @return url
#' @export
#'
#' @examples imgURL("blah.png")
imgURL<-function(x,repo="stephlocke/lazyCDN", branch="master"){
  file.path("https://raw.githubusercontent.com",repo,branch, x)
}