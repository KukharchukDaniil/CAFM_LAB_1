library(shiny)

shinyUI(fluidPage(
  
  sidebarLayout(
    sidebarPanel(
     
      
      textInput("symb", "Enter Valid Stock Symbol:", value = "", width = NULL, placeholder = NULL),
  
    
      dateRangeInput("dateRange",start = "1900-01-01", max = Sys.Date(),end = Sys.Date(), "Choose date range:",format = "yyyy-mm-dd")
    ),
    
    mainPanel(textOutput("text1"),textOutput("text2"),plotOutput("plot")))
  )
)