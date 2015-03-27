fluidPage(
  fluidRow(
    column(3,
           selectInput("breakstatus",
                       label = "Do you need a break?",
                       choices = c("Yes", "No"),
                       selected="No")
    ),
    column(9,
           sliderInput("complexity",
                       label=HTML("How're you finding it?<br>
                       0=Way too simple 10=Way too hard"),
                       min=0 , max=10, value=5 ,
                      ticks=FALSE)
    )
  ),
  fluidRow(textOutput("uppercase"))
    
  )