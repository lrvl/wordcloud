library(shiny)

shinyServer(function(input, output, session) {
  # Define a reactive expression for the document term matrix
  
  terms <- reactive({
    # Change when the "update" button is pressed...
    
    input$update
    
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Tekst verwerken...")
        getTermMatrix(input$selection)
      })
    })
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(3,0.5),
                  min.freq = input$freq, max.words=input$max,rot.per=.1,
                  colors=brewer.pal(8, "Dark2"))
    graphics.off()
    pdf(NULL)
  })
})
