library(shiny)
require(markdown)

# Define UI for application that draws a histogram
shinyUI(
  
  navbarPage("Prediction model for Fertility based on swiss data from end of XIX",
    tabPanel("Prediction",
  
        # Sidebar with a slider input for number of bins 
        sidebarLayout(
          sidebarPanel(
             sliderInput("sliderEdu","What percentage of draftees in the region have education beyond primary school?",1,60,value=11),
             sliderInput("sliderCath","What is the percentage of catholic?",1,100,value=41),
             submitButton("Submit")
          ),
          
          # Show a plot of the generated distribution
          mainPanel(
             plotOutput("plotfert"),
             h3("Predicted Fertility based on the input from the slidebars"),
             textOutput("predfert")
          )
        )
    ),
    tabPanel("Instructions",
             mainPanel(
               includeMarkdown("about.md")
             )
    )
  )
)
             
