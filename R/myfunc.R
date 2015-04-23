#' Function designed purely to show unit testing
#' 
#' @param a numeric
#' @param b numeric
#' @param c character

myfunc<-function(a=1,b=2,c="blah"){
  stopifnot(is.numeric(a), is.numeric(b),
            is.character(c))
  d<-ifelse(a<0 , a*b , a/b )
  
  e<-paste0(c,d)
  
  return(e)
}