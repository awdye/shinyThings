library(shiny)

#setwd ("C:/shiny/pc1scores")


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  
  # Application title
  titlePanel("pc1Scores"),
  
  
  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider1",
                  "Adjust x max values",
                  min = 79,
                  max = 2011,
                  value = c(733,896))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      
      plotOutput("chron_plot"),
      
    )
    
  )
))
