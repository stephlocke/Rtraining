
## ----dbconnect, echo=TRUE, eval=TRUE,warning=FALSE-----------------------
# Getting data
library("RODBC")

# Manipulating data
library("data.table")

# Build a connection to the DB for reuse
# Driver names can vary eg 
# {ODBC Driver 11 for SQL Server}
azure <- odbcDriverConnect(
          "Driver={SQL Server Native Client 11.0};
          Server=mhknbn2kdz.database.windows.net;
          Database=AdventureWorks2012;
          Uid=sqlfamily;
          Pwd=sqlf@m1ly;")


## ----, echo=TRUE, eval=FALSE---------------------------------------------
## Order    <- data.table( sqlQuery( azure,
##          "SELECT * FROM [Sales].[SalesOrderHeader]"))
## 
## Territory<- data.table( sqlQuery( azure,
##          "SELECT * FROM [Sales].[SalesTerritory]"))
## 
## Region   <- data.table( sqlQuery( azure,
##          "SELECT * FROM [Person].[CountryRegion]"))


## ----datagen, echo=FALSE, eval=TRUE--------------------------------------
if(azure!=-1L){
Order    <- data.table( sqlQuery( azure, 
         "SELECT * FROM [Sales].[SalesOrderHeader]"))

Territory<- data.table( sqlQuery( azure, 
         "SELECT * FROM [Sales].[SalesTerritory]"))

Region   <- data.table( sqlQuery( azure, 
         "SELECT * FROM [Person].[CountryRegion]"))
}
#Some error handling for if generating purely offline
if(azure==-1L){
library(data.table)
Order<-fread("DataBackups/Order.csv")
OrderTerritory<-fread("DataBackups/OrderTerritory.csv")
Region<-fread("DataBackups/Region.csv")
Territory<-fread("DataBackups/Territory.csv")
}


