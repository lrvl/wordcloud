shinyUI(
  fluidPage(
    # Application title
    titlePanel("Workshop - Deltares ICT Stip aan de horizon"),
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    ),
    
    sidebarLayout(
      # Sidebar with a slider and selection inputs
      sidebarPanel(
        #######
        fileInput("selection", "Upload je tekst:"),
        
        
        actionButton("update", "Update"),
        hr(),
        sliderInput("freq",
                    "Minimale woord frequentie:",
                    min = 1,  max = 50, value = 1),
        sliderInput("max",
                    "Maximaal aantal woorden:",
                    min = 1,  max = 300,  value = 300)
      ),
      
      # Show Word Cloud
      mainPanel(
        plotOutput("plot")
      )
    )
  )
)
