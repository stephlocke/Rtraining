# ---- LoadD2 ----
library(readxl)
library(readr)
library(data.table)

piracy<-readxl::read_excel(system.file("extdata/ListOfIncidentsPirate.xlsx",package = "Rtraining"))
setDT(piracy)
shiptypes<-data.table(read_csv(system.file("extdata/ShipTypes.csv",package = "Rtraining")))
setkey(shiptypes, `Ship Type`)
setkey(piracy,`Ship Type`)
dt2<-piracy[shiptypes]
dt2[,PiracyDate:=as.Date(Date)]

# ---- TableD2 ----
knitr::kable(t(dt2[,lapply(.SD,uniqueN)]))

# ---- ChartD2 ----
library(ggplot2)
ggplot(data=dt2, aes(x=PiracyDate,y=..density..))+
  geom_density(fill="blue", colour="blue", alpha=.5)+
  optiRum::theme_optimum()
