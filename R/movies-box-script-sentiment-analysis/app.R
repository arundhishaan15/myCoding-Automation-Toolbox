#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Libraries
library(shiny)
library(shinythemes)
library(RSentiment)
library(readr)
library(RSentiment)
library(rJava)
library(xlsx)

if (interactive()) {
    
    ui <- fluidPage(
        sidebarLayout(
            sidebarPanel(
                fileInput("file1", "Choose CSV File",
                          accept = c(
                              "text/csv",
                              "text/comma-separated-values,text/plain",
                              ".csv")
                ),
                tags$hr(),
                checkboxInput("header", "Header", TRUE)
            ),
            mainPanel(
                plotOutput("senti_bar")
            )
        )
    )
    
    server <- function(input, output) {

        output$senti_bar <- renderPlot({
            inFile <- input$file1
            
            if (is.null(inFile))
                return(NULL)
            
            dataset <- read.csv(inFile$datapath, header = input$header)
            
            sentences <- c()
            
            for (i in 1:nrow(dataset)) {
                sentences[i] <- simpsons_dataset$spoken_words[i]
            }
            
            gc()
            
            scores <- calculate_score(sentences)
            
            gc()
            
            sentiment <- calculate_sentiment(sentences)
            
            gc()
            
            plot.data <- data.frame(sentences,scores,sentiment)
            am_object <- table(plot.data$sentiment)
            visual.data <- prop.table(am_object)
            barplot(visual.data, main="Sentiment % Breakdown", xlab="Sentiment Classification", col= "blue")
        })
    }
    
    shinyApp(ui, server)
}