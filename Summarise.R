
## ----, echo=TRUE, eval=TRUE,  results='hide'-----------------------------
OrderTerritory[  , #Nothing in first position this time
               .( Value  = sum(TotalDue) ,
                  Volume = .N ), # Aggregations
               by = Name # Group by, no alias
               ]


## ----firsttable, echo=FALSE, eval=TRUE,  results='asis'------------------
knitr::kable(OrderTerritory[  , #Nothing in first position this time
               .( Value  = sum(TotalDue) ,
                  Volume = .N ), # Aggregations
               by = Name # Group by, no alias
               ]
        )


## ----, echo=TRUE, eval=TRUE,  results='hide'-----------------------------
OrderTerritory[ order(TotalDue, decreasing = TRUE)[1:5] ,
                # Picks first 5 rows of TotalDue desc
               .( SalesOrderNumber, # .( ) allows multi-select
                  AccountNumber,
                  Region=Name, # Aliasing colum
                  TotalDue,
                  OrderDate
                  )
               ]


## ----secondtable, echo=FALSE, eval=TRUE,  results='asis'-----------------
knitr::kable(OrderTerritory[ order(TotalDue, decreasing = TRUE)[1:5] ,
               .( SalesOrderNumber,
                  AccountNumber,
                  Region=Name,
                  TotalDue,
                  OrderDate
                  )
               ]
        )


## ----, echo=TRUE, eval=TRUE,  results='hide'-----------------------------
OrderTerritory[  ,
               .SD[which.max(TotalDue),
               # .SD is subset of rows within a group
               # which.max() returns row # of largest val
                   .( SalesOrderNumber,
                      AccountNumber,
                      TotalDue,
                      OrderDate
                    )
                   ],
               by=.(Region=Name)
               #Aliasing in groupung
               ]


## ----thirdtable, echo=FALSE, eval=TRUE,  results='asis'------------------
knitr::kable(OrderTerritory[  ,
               .SD[which.max(TotalDue),
                   .( SalesOrderNumber,
                      AccountNumber,
                      TotalDue,
                      OrderDate
                    )
                   ],
               by=.(Region=Name)
               ]
        )

