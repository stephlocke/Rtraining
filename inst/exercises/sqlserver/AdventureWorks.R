# 1.  Turn on access to ODBC
# 2.  Turn on data.table processing
# 3.  Get data from the database
#       + Build a connection to the DB and store it for reuse
#       + Bring in [Sales].[SalesOrderHeader], [Sales].[SalesTerritory], [Person].[CountryRegion]
#       + ALTERNATIVELY, read CSVs in
# 4.  Write a query that returns the best 5 sales ever (by TotalDue)
# 5.  Write a query that returns the volume of sales by OrderDay
# 6.  Write a query that returns the volume sales grouped by ShippingMethod for the territory 10 (based on TerritoryID)
# 7.  Write a query that returns the best ever sale (by TotalDue) record for each territory
# 8.  Write a query that returns the best 5 salesman ever (by TotalDue)
# 9.  Write a query (and store the results) of INNER JOINing Order and Territory
# 10. Write a query (and store the results) of INNER JOINing Region on to the results of the previous step
# 11. Write a query that returns the best ever sale (by TotalDue) record for each region
# 12. Write a query that returns for each region, the best 5 salesman ever (by TotalDue)

# 1. Turn on access to ODBC
library("RODBC")

# 2. Turn on data.table processing
library("data.table")

# 3. Get data from the database
#     + Build a connection to the DB and store it for reuse
#     + Bring in [Sales].[SalesOrderHeader], [Sales].[SalesTerritory], [Person].[CountryRegion]
#     + ALTERNATIVELY, read CSVs in

# Driver names can vary eg {ODBC Driver 11 for SQL Server}
azure <- odbcDriverConnect(
  "Driver={SQL Server Native Client 11.0};
  Server=mhknbn2kdz.database.windows.net;
  Database=AdventureWorks2012;
  Uid=sqlfamily;
  Pwd=sqlf@m1ly;")

Order    <- data.table( 
  sqlQuery( azure, 
            "SELECT * FROM [Sales].[SalesOrderHeader]"))

Territory<- data.table( 
  sqlQuery( azure, 
            "SELECT * FROM [Sales].[SalesTerritory]"))

Region   <- data.table( 
  sqlQuery( azure, 
            "SELECT * FROM [Person].[CountryRegion]"))


# 4. Write a query that returns the best 5 sales ever (by TotalDue)
Order[order(TotalDue,decreasing = TRUE)[1:5]]


# 5. Write a query that returns the volume of sales by OrderDay
Order[,.N,OrderDate]


# 6. Write a query that returns the volume sales grouped by ShippingMethod for the territory 10 (based on TerritoryID)
Order[TerritoryID==10,.N,ShipMethodID]


# 7. Write a query that returns the best ever sale (by TotalDue) record for each territory
Order[,.SD[which.max(TotalDue)],by=TerritoryID]

# 8. Write a query that returns the best 5 salesman ever (by TotalDue)
Order[!is.na(SalesPersonID),
      .(TotalDue=sum(TotalDue)),
      by=SalesPersonID][
        order(-TotalDue)[1:5]]

# 9.  Write a query (and store the results) of INNER JOINing Order and Territory
setkey(Order,TerritoryID)
setkey(Territory, TerritoryID)

OrderTerritory<-Territory[Order]


# 10. Write a query (and store the results) of INNER JOINing Region on to the results of the previous step
setkey(OrderTerritory,CountryRegionCode)
setkey(Region,CountryRegionCode)
OrderTerritoryRegion<-Region[OrderTerritory]


# 11. Write a query that returns the best ever sale (by TotalDue) record for each region
OrderTerritoryRegion[
  ,.SD[which.max(TotalDue)]
  ,by=CountryRegionCode,
  .SDcols=-c("i.ModifiedDate.1")]


# 12. Write a query that returns for each region, the best 5 salesman ever (by TotalDue)
OrderTerritoryRegion[
  !is.na(SalesPersonID),
  .SD[,.(Sales=sum(TotalDue)),
      SalesPersonID][order(-Sales)[1:5]],
  CountryRegionCode]