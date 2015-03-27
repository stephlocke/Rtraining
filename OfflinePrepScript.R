library(knitr)
library(foreach)
source(purl("Database.Rmd"))
source(purl("Dataset.Rmd"))

csvbackups<-c("Order","OrderTerritory","Region","Territory")
foreach(c= csvbackups) %do%{
  write.csv(get(c),paste0("DataBackups/",c,".csv"),row.names=FALSE)
}
