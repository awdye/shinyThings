#ui:
  
library(shiny)
library(dplR)

#setwd ("C:/WVU/shinyThings")


# Define variables


shinyUI(fluidPage(
  
  
  # Application title
  titlePanel("pc1Scores"),
  
  
  
  #Sidebar with a slider input 
  #sidebarLayout(
    sidebarPanel(
      sliderInput("slider1",
                  "Adjust x max values",
                  min = 79,
                  max = 2011,
                  value = c(733,896)),
      
      #numericInput("numeric1",
                  # "Choose spline:",
                  # 15,
                 #  min = 1,
                 #  max = 101),
      radioButtons(inputId = "button1", 
                   label = "adjust spline", 
                   choices = c("5"="pc1_spl5", "15"="pc1_spl15", "25"="pc1_spl25", "51"="pc1_spl51", 
                               "101"="pc1_spl101")
                   ,selected = "pc1_spl15"),
      radioButtons("button2",
                   "std chronologies",
                   c("klp"="klp_std", "ulp"="ulp_std")),
    mainPanel(plotOutput("chron_plot")))
        ))
