#setwd ("C:/WVU/shinyThings")
library(dplR)

# Define server logic required to draw a chron_plot
shinyServer(function(input, output) {
  
  #read in data
  pc1_scores = read.table ("Pc_scores.txt", header=TRUE)
  year = as.numeric(pc1_scores$year)
  pc1_score = pc1_scores$PC1_score
  total_sd = as.numeric(pc1_scores$total_sd)
  
  #create an action button for spline stiffness
  pc1_spl5 = ffcsaps(pc1_score, year, nyrs= 5) 
  pc1_spl15 = ffcsaps(pc1_score, year, nyrs= 15)
  pc1_spl25 = ffcsaps(pc1_score, year, nyrs= 25)
  pc1_spl51 = ffcsaps(pc1_score, year, nyrs= 51)
  pc1_spl101 = ffcsaps(pc1_score, year, nyrs= 101)
  klp_std = pc1_scores$klp_std
  ulp_std = pc1_scores$ulp_std
  
  output$chron_plot <- renderPlot({
    paste("you have selected", input$slider1)
    #spline = ffcsaps(pc1_score, year, nyrs = input$numeric1)
    layout(matrix(c(1,2), byrow=TRUE), widths=c(8,8), heights=c(3,1), TRUE)
    
    #pc scorers plot
    plot(year,pc1_score,type="l", col="grey30", xaxt="n", axes=FALSE, xlim = input$slider1, 
         ylim=c(-3,3), cex.lab=0.75, ylab="", xlab="", lwd = 2.0, cex.axis=0.75)
    lines(year, input$button1, col="grey30", lwd = 3)
    lines(year, input$button2, col="red", lwd = 3)
    
    # sample depth plot 
    plot(year, total_sd, col='grey30', type='l', ylab="", xlim = input$slider1, 
         ylim=1.5*c(0, max(total_sd)))
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

