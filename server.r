library(quantmod)
library(shiny)

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    output$text1 <- renderText({paste("Output: ", input$symb)})
  
    tryCatch({
      data <- getSymbols(
        input$symb,
        src = "yahoo",
        from = input$dateRange[1],
        to = input$dateRange[2],
        auto.assign = FALSE
      )
    },
    error=function(e) {
      output$text1 <- renderText({paste(input$symb, " is not a valid symbol.")})
      return(NULL) 
    }
    )
    tryCatch({
      chartSeries(data,
                  TA = NULL)
    },
    error=function(e) {
      output$text2 <- renderText({paste("")})
      return(NULL) 
    }
    )
  }
  ) 
})