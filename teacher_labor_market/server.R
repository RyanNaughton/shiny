library(shiny)


load(paste0(getwd(),"/data/sampled_data.rdata"))
data <- data_sample

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
  
  output$crossTab <- renderPlot({
    tmp <- table(data[,input$variable_1],data[,input$variable_2])
    if(input$as_percent){
      tmp <- as.matrix(tmp)
      tmp <- apply(X=tmp,2,FUN=function(x){
       x/sum(x)
      })
    }
    barplot(tmp)
  })
    
})