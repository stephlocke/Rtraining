
## ----, echo=TRUE, eval=TRUE----------------------------------------------
# Specify the columns to join by
setkey(Order     , TerritoryID)
setkey(Territory , TerritoryID)

# Reads as join Territory to the Order table
# Seperate table so we don't have to start again
OrderTerritory <- Territory[Order]


## ----, echo=TRUE, eval=TRUE----------------------------------------------
# Specify the columns to join by
setkey(OrderTerritory , CountryRegionCode)
setkey(Region         , CountryRegionCode)

# Reads as join Region to the OrderTerritory table
# Will overwrite as it's our desired state
OrderTerritory <- Region[OrderTerritory]

