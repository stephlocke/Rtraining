library(data.table)
library(chron)
library(ggplot2)
library(stringr)

origwd<-getwd()
setwd("inst/exercises/logscraping/")
# This doesn't cope with spaces in URLs grr!!
url_pattern <- "http[s]?://(?:[@blank:]|[a-zA-Z]|[0-9]|[$-_@.&+ ]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"

## Read data in from a text file
raw.log <- data.table(scan("bloblog.txt", character(0), sep = "\n"))

## Add date columns
raw.log[,`:=`(
  log.datetime=chron(substr(V1, 5, 14), substr(V1, 16, 23), format=c('y-m-d','h:m:s'))
  ,log.date=as.Date(substr(V1, 5, 14))
  ,download=str_extract(V1,url_pattern)
  ,source=word(V1,-2,sep=fixed(";;"))
)]

## Do a basic histogram of activity over day
ggplot(raw.log,aes(x=log.date,y=..count..,group=download,fill=download))+
  geom_histogram()+
  facet_wrap(~source, ncol=2)+
  theme_minimal()+
  theme(legend.position="bottom")

## Do a basic summary
raw.log[,.(Volume=.N), by=.(log.date,source,download)]


## reset dir
setwd(origwd)
