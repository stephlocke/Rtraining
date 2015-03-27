
## ----, echo=TRUE, eval=FALSE---------------------------------------------
## OrderTerritory[  , #Nothing in 1st position
##                .( Value  = sum(TotalDue) ,
##                   Volume = .N ), # Aggregations
##                by = Name # Group by, no alias
##                ]


## ----firsttable, echo=FALSE, eval=TRUE-----------------------------------
knitr::kable(OrderTerritory[  , #Nothing in 1st position
               .( Value  = sum(TotalDue) ,
                  Volume = .N ), # Aggregations
               by = Name # Group by, no alias
               ]
        )


## ----, echo=TRUE, eval=FALSE---------------------------------------------
## OrderTerritory[order(-TotalDue)[1:5],
##                # Picks first 5 rows of TotalDue desc
##                .( SalesOrderNumber, # multi-select
##                   AccountNumber,
##                   Region=Name, # Aliasing colum
##                   TotalDue,
##                   OrderDate
##                   )
##                ]


## ----secondtable, echo=FALSE, eval=TRUE----------------------------------
knitr::kable(OrderTerritory[order(-TotalDue)[1:5],
               # Picks first 5 rows of TotalDue desc
               .( SalesOrderNumber, # multi-select
                  AccountNumber,
                  Region=Name, # Aliasing colum
                  TotalDue,
                  OrderDate
                  )
               ]
        )


## ----, echo=TRUE, eval=FALSE---------------------------------------------
## OrderTerritory[  ,
##                .SD[which.max(TotalDue),
##                # .SD is subset of rows within group
## 
##                # which.max() returns row
##                # no of largest val
##                    .( SalesOrderNumber,
##                       AccountNumber,
##                       TotalDue,
##                       OrderDate
##                     )
##                    ],
##                by=.(Region=Name)
##                #Aliasing in groupung
##                ]


## ----thirdtable, echo=FALSE, eval=TRUE-----------------------------------
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

