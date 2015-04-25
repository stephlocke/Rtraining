library(readxl)
library(data.table)

## Data load ----
piracy<-readxl::read_excel("inst/extdata/ListOfIncidentsPirate.xlsx")
setDT(piracy)

## First summaries ----
summary(piracy)
## Unique values
piracy[,lapply(.SD,uniqueN)]
## Unique values proportion
piracy[,lapply(.SD, function(x) uniqueN(x)/.N)]

## Data cleanup ----
## convert to date
piracy[,IncidentDate:=as.Date(Date)]
## extract the meaningful component of attack location
library(stringr)
piracy[,AttackArea:=tstrsplit(Area," ")[[2]]]
piracy[AttackArea=="stated",AttackArea:=NA]
## sort out ship type - make unique list for cleanup
# library(readr)
# write_csv(piracy[,.(`Ship Type`=unique(`Ship Type`))],"ShipTypes.csv")
shiptypes<-data.table(read_csv("inst/extdata//ShipTypes.csv"))
setkey(shiptypes, `Ship Type`)
setkey(piracy,`Ship Type`)
piracy<-piracy[shiptypes]

## Some charts ----
library(ggplot2)

ggplot(piracy,
       aes(x=Category,y=..count..))+
  geom_histogram()+
  theme_minimal()
ggplot(piracy, 
       aes(x=Category, group=AttackArea,  fill= AttackArea, colour=AttackArea))+
  geom_density(alpha=.5)+
  theme_minimal()

