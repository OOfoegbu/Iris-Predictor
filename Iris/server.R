library(shiny)
shinyServer(function(input, output) {
    library(caret)
    library(randomForest)
    modFit <- randomForest(Species~., data=iris)
    
    modelpred <- reactive({
        Sepal.Length <- input$sliderSepal.Length
        Sepal.Width <- input$sliderSepal.Width
        Petal.Length <- input$sliderPetal.Length
        Petal.Width <- input$sliderPetal.Width
        predict(modFit, newdata = data.frame(Sepal.Length = Sepal.Length, Sepal.Width = Sepal.Width,
                                             Petal.Length = Petal.Length, Petal.Width = Petal.Width))
        
    })
    
    
    
    output$plot1 <- renderPlot({
        Sepal.Length <- input$sliderSepal.Length
        Sepal.Width <- input$sliderSepal.Width
        Petal.Length <- input$sliderPetal.Length
        Petal.Width <- input$sliderPetal.Width
        
        plot(iris$Sepal.Length, iris$Petal.Length, col = factor(iris$Species),
             xlab = "Sepal Length", ylab = "Petal Length", main = "Iris Species")
        legend("bottomright", c("setosa", "versicolor", "virginica", "user input"), pch = c("o", "o", "o", "+"), bty = "n", col = c("black", "red", "green", "black"))
        points(Sepal.Length, Petal.Length, pch = "+", cex = 2)
    })
    
    output$pred <- renderText({
        modelpred()
    })
    
    output$legend <- renderTable({
        data.frame(Specie = c("1. - setosa", "2. - versicolor", "3. - virginica"))
    })
})
