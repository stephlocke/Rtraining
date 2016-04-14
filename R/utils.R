imgURL<-function(x,repo="stephlocke/lazyCDN", branch="master"){
  file.path("https://raw.githubusercontent.com",repo,branch, x)
}