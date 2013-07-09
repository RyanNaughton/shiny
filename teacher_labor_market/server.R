library(shiny)

load("C:/Users/Juliana/Documents/IDB/Teacher Labor Market/shiny/teacher_labor_market/data/sampled_data.rdata")
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
    #tmp <- as.matrix(tmp)
    barplot(tmp)
    #tmp2 <- apply(X=tmp,2,FUN=function(x){
    #  x/sum(x)
    #})
    #barplot(tmp2,main=paste(selected_one,"~",selected_two))
  })
    
})