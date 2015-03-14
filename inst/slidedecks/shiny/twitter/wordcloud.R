wordcloudgen <- function (v=allcomments[sentiment!="negative",value]) {
  allc<-VectorSource(v)
  corp<-Corpus(allc)
  foreach(j=seq(corp)) %do% {
    corp[[j]] <- gsub("/"," ",corp[[j]])
    corp[[j]] <- gsub("@"," ",corp[[j]])
  }
  corp<- tm_map(corp,tolower)
  corp<- tm_map(corp,removeWords, stopwords("english"))
  corp<- tm_map(corp,removeNumbers)
  corp<- tm_map(corp,removePunctuation)
  corp <- tm_map(corp,stripWhitespace)
  corp <- tm_map(corp, PlainTextDocument)
  dtm <- DocumentTermMatrix(corp)
  
  m <- as.matrix(dtm)
  v <- sort(colSums(m),decreasing=TRUE)
  head(v,14)
  words <- names(v)
  d <- data.frame(word=words, freq=v)
  pal <- brewer.pal(6,"RdYlBu")[1:4][4:1]
  commentcloud<-wordcloud(d$word,d$freq,c(8,3),2,,FALSE,,.15,pal)
  print(commentcloud)
}

