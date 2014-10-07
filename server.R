#setwd ("C:/shiny/pc1scores")
#library(dplR)

# Define server logic required to draw a chron_plot
shinyServer(function(input, output) {
  
  #read in data
  pc1_scores = read.table ("PC1_scores.txt", header=TRUE)
  year = pc1_scores$year
  pc1_score = pc1_scores$PC1_score
  spline_15 = pc1_scores$spline_15
  total_sd = pc1_scores$total_sd
  
  output$chron_plot <- renderPlot({
    paste("you have selected", input$slider1)
    layout(matrix(c(1,2), byrow=TRUE), widths=c(8,8), heights=c(3,1), TRUE)
    
    #pc scorers plot
    plot(year,pc1_score,type="l", col="grey30", xaxt="n", axes=FALSE, xlim = input$slider1, 
         ylim=c(0,2), cex.lab=0.75, ylab="", xlab="", lwd = 2.0, cex.axis=0.75)
    lines(year,spline_15, col="grey30", lwd = 3),
    
    # sample depth plot 
    plot(year, total_sd, col='grey', type='l', ylab="", xlim = input$slider1, ylim=1.5*c(0, max(total_sd)))
    axis(1,at=seq(0,2000, by=50))
  })
       
  })
  
  
  



#To make a web page. Seems to run best outside of the server/ui app. Basically, installing
#devtools and shinyapps libraries:

#if(!require("devtools"))
# install.packages("devtools")
#devtools::install_github("rstudio/shinyapps")

#And then telling the computer to send app to your account on shiny.io to make a web link:

#setAccountInfo(
# name="awdgeog",
#token="753D87E9E7F7EE199759BBEE2DC41512",
#secret="NeidIKFVD7pfnvHGeXGWtQA6XXqiAltvWgKqG72n")