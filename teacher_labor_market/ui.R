library(shiny)

variables <- list("Sex" = "sex",
                  "Year" = "year",
                  "Industry" = "indgen",
                  "Employment Status" = "empstat")

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Cross Tabulations"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    
    selectInput("variable_1", "Variable 1:", variables),
    selectInput("variable_2", "Variable 2:", variables)
    
  ),
  
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("crossTab")
    )
))