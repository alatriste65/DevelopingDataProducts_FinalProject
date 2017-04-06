#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   data(swiss)
   library(ggplot2)
   model_fert <- lm(Fertility~Agriculture+Education,data=swiss)
   
   model_fert_pred <- reactive({
     AgriInput <- input$sliderAgri
     EduInput <- input$sliderEdu
     predict(model_fert,newdata=data.frame(Agriculture=AgriInput,Education=EduInput))
   })
   
   output$plotfert <- renderPlot({
     AgriInput <- input$sliderAgri
     EduInput <- input$sliderEdu
     modfit<- predict(model_fert,newdata=data.frame(Agriculture=swiss$Agriculture,Education=swiss$Education))
     swiss$modfit <- modfit
     
     ggplot(swiss,aes(x=Education,y=Fertility))+xlim(1,60)+geom_point(aes(color=Agriculture))+xlab("Education")+ylab("Fertility")+ggtitle("Prediction Model for Fertility")+geom_smooth(data=swiss,aes(x=Education,y=modfit),se=FALSE,stat="smooth")+geom_point(aes(x=EduInput,y=model_fert_pred()),color="red",size=5)
   })
   
   output$predfert <- renderText({
     model_fert_pred()
   })
})
