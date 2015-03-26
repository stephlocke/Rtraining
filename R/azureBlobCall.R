#' Azure Blob Storage API call
#'
#' This function enacts a call to the Azure Blob storage
#'
#' @param url Azure Blob container endpoint
#' @param verb Name of verb that you're intending to use components with
#' @param key The primary or secondary access key as-is from Azure Portal
#' @param ... Additional parameters to httr::VERB
#' @param simple API call response content, or supplemented
#' @param tz  Optional parameter for setting time zone for call
#' 
#' 
#' @return content The response from the API
#'
#'
#' @export

azureBlobCall<-function(url,verb="GET",key,...,simple=TRUE,tz="GMT"){
  necessarydetails<-azureBlobPrep(url,verb,key,tz)
  
  call<-httr::VERB(verb=verb,url =url,config = necessarydetails$header,... )
  
  content<-if(simple){content(call)
  }else{
    list(azureBlobPrepResults=necessarydetails, content=content(call))
  }
  return(content)
  
}