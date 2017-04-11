# server.R
library(shiny)

# startup code
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      percent_map(var = counties[, input$var], color = "darkgreen", 
                  legend.title = names(race_choices[race_choices == input$var]),
                  min = input$range[1], max = input$range[2])
    })
      
  }
)
    