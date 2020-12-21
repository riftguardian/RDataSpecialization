#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(ggpubr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$plot1 <- renderPlot({
        dataX <- mtcars[,input$varX]
        dataY <- mtcars[,input$varY]
        
        fit <- lm(dataY ~ dataX)
        
        # draw the histogram with the specified number of bins
        gg <- ggplot(mtcars, aes_string(x = input$varX, y = input$varY)) + 
            geom_point() + geom_smooth(method = 'lm', se = FALSE) +
            stat_regline_equation(label.y = max(dataY) * .9) +
            stat_cor(label.y = max(dataY) * .95)
        plot(gg)

    })

})
