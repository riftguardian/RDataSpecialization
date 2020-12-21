#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("MTCARS Dataset"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Select Parameters for Linear Model"),
            selectInput("varX", "X Parameter", choices = names(mtcars), selected = 'qsec'),
            selectInput("varY", "Y Parameter", choices = names(mtcars), selected = 'mpg')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1")
        )
    )
))
