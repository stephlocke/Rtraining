# ---- LoadD1 ----
library(data.table)
dt1<-fread(system.file("extdata/Accidents2013.csv",package = "Rtraining"))
dt1[,AccidentDate:=as.Date(Date,format = "%d/%m/%Y")]

# ---- TableD1 ----
interestingCols<-colnames(dt1)[1:5]
knitr::kable(dt1[,lapply(.SD,uniqueN),.SDcols=interestingCols])

#--- ChartD1 ----
library(ggplot2)
ggplot(data=dt1, aes(x=AccidentDate,y=..density..))+
  geom_density(fill="blue", colour="blue", alpha=.5)+
  optiRum::theme_optimum()
