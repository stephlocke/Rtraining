library(knitr)
#Extract r code (`purl`) from my presentation where necessary and run it( `source`)
suppressWarnings({ source(purl("Database.Rmd"))
source(purl("Dataset.Rmd"))
})
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