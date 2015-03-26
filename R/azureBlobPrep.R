#' Azure Blob Storage interactions prep
#'
#' This function produces all the various compononents 
#' needed to use the Azure Blob API
#'
#' @param url Azure Blob container endpoint
#' @param verb Name of verb that you're intending to use components with
#' @param key The primary or secondary access key as-is from Azure Portal
#' @param tz  Optional parameter for setting time zone for call
#' 
#' 
#' @return components List containing various required values / objects
#'
#' 
#'
#' @export

azureBlobPrep<-function(url,verb="GET",key,tz="GMT"){
  urlcomponents<-httr::parse_url(url)
  
  account<-gsub(".blob.core.windows.net","",urlcomponents$hostname,fixed = TRUE)
  container<-urlcomponents$path
  
  `x-ms-date`<-format(Sys.time(),"%a, %d %b %Y %H:%M:%S %Z", tz=tz)
  CanonicalizedHeaders <- paste0("x-ms-date:",`x-ms-date`,"\nx-ms-version:2009-09-19")
  
  components<-data.frame(names=unclass(names(unlist(urlcomponents$query))),
                         values=unlist(urlcomponents$query))
  componentstring<- paste(components[order(components$names),]$names,components[order(components$names),]$values,sep=":",collapse="\n")
  CanonicalizedResource <-paste0("/",account,"/",container,"\n",componentstring)
 
  signaturestring<-paste0(verb,
                          paste(rep("\n",12),collapse=""),
                          CanonicalizedHeaders,"\n",
                          CanonicalizedResource
                        )
  
 undecodedkey<-RCurl::base64Decode(key, mode="raw")
 
 requestspecificencodedkey<-RCurl::base64(
   digest::hmac(key=undecodedkey,
                object=enc2utf8(signaturestring),
                algo= "sha256", raw=TRUE)
   )
 
 authorizationtoken<-paste0("SharedKey ",account,":",requestspecificencodedkey  )
 
 headers<-add_headers(Authorization=authorizationtoken, `x-ms-date`=`x-ms-date`,`x-ms-version`="2009-09-19")
 
 components<-list(verb=verb, account=account, container=container, signaturestring=signaturestring,
                  `x-ms-date`=`x-ms-date`, header=headers )
  
 return(components)
}