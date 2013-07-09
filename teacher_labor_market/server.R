library(shiny)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
    
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste(input$variable_1, "~", input$variable_2)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
    
})