library(shiny)

variables <- list("Sex" = "sex", 
                  "Employment Status" = "empstat", 
                  "Industry" = "indgen", 
                  "Year" = "year")
# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Cross Tabulations"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    
    selectInput("variable_1", "Variable 1:",variables),
    selectInput("variable_2", "Variable 2:",variables)
    )
    
    #checkboxInput("outliers", "Show outliers", FALSE)
  ),
  
  mainPanel()
))