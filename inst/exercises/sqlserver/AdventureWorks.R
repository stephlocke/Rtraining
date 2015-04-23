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

Order    <- data.table( sqlQuery( azure, 
                                  "SELECT * FROM [Sales].[SalesOrderHeader]"))

Territory<- data.table( sqlQuery( azure, 
                                  "SELECT * FROM [Sales].[SalesTerritory]"))

Region   <- data.table( sqlQuery( azure, 
                                  "SELECT * FROM [Person].[CountryRegion]"))