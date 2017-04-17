library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict the Species of Iris FLower"),
    
    # Sidebar with a slider input for flower dimensions 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderSepal.Length", "What is the length of the Sepal", 4.0, 8.0, value = 5.0),
            sliderInput("sliderSepal.Width", "What is the width of the Sepal", 2.0, 4.5, value = 3.0),
            sliderInput("sliderPetal.Length", "What is the length of the Petal", 1.0, 7.0, value = 4.0),
            sliderInput("sliderPetal.Width", "What is the width of the Petal", 0.1, 2.5, value = 1.1)
        ),
        
        # Show a plot of the predicted species
        mainPanel(
            plotOutput("plot1"),
            h2("Predicted Specie"),
            textOutput("pred"),
            h2("Species Legend"),
            tableOutput("legend")
        )
    )
))
