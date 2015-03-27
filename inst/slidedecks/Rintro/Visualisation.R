
## ----, echo=TRUE, eval=FALSE,  results='hide'----------------------------
## library(ggplot2)
## 
## ggplot(OrderTerritory                 # dataset
##        ,aes(x=Name, y=..count..))+    # values
##   geom_bar()+                         # chart type
##   theme_minimal()+                    # themeing
##   labs(x="Region",title="All time sales volumes")


## ----chartone, echo=FALSE, eval=TRUE,  results='asis'--------------------
library(ggplot2)

ggplot(OrderTerritory                 # dataset
       ,aes(x=Name, y=..count..))+    # values
  geom_bar()+                         # chart type
  theme_minimal()+                    # themeing
  labs(x="Region",title="All time sales volumes")


## ----, echo=TRUE, eval=FALSE,  results='hide'----------------------------
## library(scales)
## 
## ggplot(OrderTerritory
##        ,aes(x=Name, y=TotalDue))+
##   geom_bar(stat="identity")+         # use value
##   theme_minimal()+
##   scale_y_continuous(label=dollar)+  # customisation
##   labs(x="Region",title="All time sales value")


## ----charttwo, echo=FALSE, eval=TRUE,  results='asis'--------------------
library(scales)

ggplot(OrderTerritory               
       ,aes(x=Name, y=TotalDue))+    
  geom_bar(stat="identity")+         # use value
  theme_minimal()+                   
  scale_y_continuous(label=dollar)+  # customisation
  labs(x="Region",title="All time sales value")


## ----, echo=TRUE, eval=FALSE,  results='hide'----------------------------
## ggplot(OrderTerritory
##        ,aes(x=year(OrderDate), y=TotalDue,
##             colour=Name))+
##   geom_bar(stat="identity")+
##   theme_minimal()+
##   scale_y_continuous(label=dollar)+
##   facet_wrap(~Name,ncol = 2) +   # trellis
##   xlab("Order Year")


## ----chartthree, echo=FALSE, eval=TRUE,  results='asis'------------------
ggplot(OrderTerritory
       ,aes(x=year(OrderDate), y=TotalDue, colour= Name))+ 
  geom_bar(stat="identity", colour="light blue")+
  theme_minimal()+                  
  scale_y_continuous(label=dollar)+ 
  facet_wrap(~Name,ncol = 2) +   # trellis
  xlab("Order Year")

