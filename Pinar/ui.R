#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

list.countries <- c("Albania", "Azerbaijan", "Austria", "Armenia" ,"Bosnia and Herzegovina", "Bulgaria", "Belarus", "Croatia", "Czechia", "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Hungary", "Iceland", "Italy", "Lithuania", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "North Macedonia", "Great Britain" )

# Define UI for application that draws a plot
shinyUI(fluidPage(

    # Application title
    titlePanel("European Value Survey from 2017"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
           
           tags$h3("Overview"),
            p("Select a country from the drop down menu a) Exploration panel to visualize how dependent variables (agreement if the child suffers when the mother works and if the job should be given to a national) change by age for
              control variables: sex and education b) regression panel assess the strength of relationship between dependent variables and predictors (age, sex, education) "),
            selectInput(inputId = 'Countries',
                        label = "Select country:",
                        choices = list.countries),
           
           selectInput(inputId = 'YVariable',
                       label = "Select Y:",
                       choices = c("child_suffer", "job_national")),
            
            radioButtons(inputId = "Sex" ,
                         label = "Select sex",
                         choices =  c("Female", "Male")), 
           
           radioButtons(inputId = "Education" ,
                        label = "Select education",
                        choices =  c("Lower", "Medium" , "Higher"))
           
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Exploration", plotOutput("plot1")),
                tabPanel("Regression", verbatimTextOutput("regression"))
            )
        )
    )
))
