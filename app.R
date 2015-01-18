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

Order     <- data.table( sqlQuery( azure, 
                                   "SELECT * FROM [Sales].[SalesOrderHeader]"))

Territory <- data.table( sqlQuery( azure, 
                                   "SELECT * FROM [Sales].[SalesTerritory]"))

Region    <- data.table( sqlQuery( azure, 
                                   "SELECT * FROM [Person].[CountryRegion]"))

# Specify the columns to join by
setkey(Order     , TerritoryID)
setkey(Territory , TerritoryID)

# Reads as join Territory to the Order table
# Seperate table so we don't have to start again
OrderTerritory <- Territory[Order]

server <- function(input, output) {
  library("ggplot2")
  library("scales")

  
  output$distPlot <- renderPlot({
    ggplot(OrderTerritory[Name %in% input$Regions]               
           ,aes(x=Name, y=TotalDue))+    
      geom_bar(stat="identity")+         # use value
      theme_minimal()+                   
      scale_y_continuous(label=dollar)+  # customisation
      labs(x="Region",title="All time sales value")
  })
}

ui <- shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("Regions", "Which Regions:", choices=OrderTerritory[,unique(as.character(Name))]
                  , selected=OrderTerritory[,unique(as.character(Name))]
                  ,multiple=TRUE
                  )
    ),
    mainPanel(plotOutput("distPlot"))
  )
))

shinyApp(ui = ui, server = server)