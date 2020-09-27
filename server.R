#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(readr)
library(plotly)
ALL_ROW_REGIONS <- read_csv("all_row_regions.csv")
ALL_FABLE_COUNTRIES <- read_csv("all_fable_countries.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot1 <- renderPlotly({

        if(input$graficaType=="all row regions")
        {
          
         grafica_1<-ggplot(data=ALL_ROW_REGIONS,aes(x=Year,y=net_forest_change))+
            geom_bar(stat = "identity", fill="#FFC107",width=3)+
            geom_point(aes(x=Year,y=GFW_deforestation))+
            geom_point(aes(x=Year,y=forest_target),colour="red")+
            geom_point(aes(x=Year,y=net_forest_change),colour="green")+scale_y_continuous(breaks=seq(0, -17500, -2500)) #Marcas del 0 al -17500, cada -2500.  
         b<-ggplotly(grafica_1)
         b
      
        }else if(input$graficaType=="all fable countries")
        {
          grafica_2<-ggplot(data=ALL_FABLE_COUNTRIES,aes(x=Year,y=aforestation))+
            geom_bar(stat = "identity", fill="#81C784",width=3)+
            geom_bar(aes(x=Year,y=forest_loss),stat = "identity", fill="#FFC107",width=3)+
            geom_point(aes(x=Year,y=net_forest_change),colour="green")+
            geom_point(aes(x=Year,y=GFW_deforestation))+
            geom_point(aes(x=Year,y=forest_target),colour="red")+scale_y_continuous(breaks=seq(60000, -30000, -20000))
          a<-ggplotly(grafica_2)
          a
        }
        
      

    })

})
