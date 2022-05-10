#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(kableExtra)
library(xtable)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    evs_17_clean <- readRDS("evs_17_clean.rds")
    data_full<-evs_17_clean
    

    output$plot1 <- renderPlot({
    
            data_full %>%
              filter(cntry == input$Countries &
                  sex == input$Sex & 
                        edu == input$Education) %>%
            ggplot(aes_string("age", input$YVariable )) +
            stat_summary(geom = "line", fun = "mean") +
            theme_minimal() +
            labs(x = "Age",
                 y = "Average agreement",
                 caption = paste("EVS 2017 from", input$Countries,
                                 " - sex = ", input$Sex,
                                 " - Education = ", input$Education))
        
    })
    

    output$regression <- renderPrint({
        data_clean2 <- data_full %>%
            filter(cntry == input$Countries)
            
        myformula  <- as.formula(paste0( input$YVariable, " ~ age + sex + edu"))
        m1 <- lm( myformula, data = data_clean2)
        summary(m1)

    })

})
