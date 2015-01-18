
## ----, echo=TRUE, eval=TRUE----------------------------------------------
# Activate the ODBC package for use getting data
library("RODBC")

#Activate the data.table package for manipulating data
library("data.table")

# Build a connection to the DB for reuse
# Driver names can vary eg {SQL Server Native Client 11.0}
azure <- odbcDriverConnect(
          "Driver={ODBC Driver 11 for SQL Server};
          Server=mhknbn2kdz.database.windows.net;
          Database=AdventureWorks2012;
          Uid=sqlfamily;
          Pwd=sqlf@m1ly;")


## ----, echo=TRUE, eval=TRUE----------------------------------------------
Order     <- data.table( sqlQuery( azure, 
             "SELECT * FROM [Sales].[SalesOrderHeader]"))

Territory <- data.table( sqlQuery( azure, 
             "SELECT * FROM [Sales].[SalesTerritory]"))

Region    <- data.table( sqlQuery( azure, 
             "SELECT * FROM [Person].[CountryRegion]"))

