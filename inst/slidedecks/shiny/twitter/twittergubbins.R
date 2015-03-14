library(twitteR)
library(data.table)
mydt<-data.table(twListToDF(searchTwitter("#SQLBits|@sqlbits",n=5000,since="2015-03-04" )))
