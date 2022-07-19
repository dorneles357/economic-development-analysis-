# Load packages
library(shiny)
library(shinythemes)
library(dplyr)
library(readr)

# Load data 
setwd("/home/ebenezer/workspace/projects/analytic/economic-development-analysis/data")
data <- read_delim("cpa-amauc.csv", 
                        delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                        trim_ws = TRUE)
attach(data)

# Define UI ---------------------------------------------------------------


ui <- fluidPage(theme = shinytheme(theme = "superhero"), lang = "pt",
                titlePanel("AMAUC - 2010"),
                sidebarLayout(
                  sidebarPanel(
                    # Select type to plot and description
                    selectInput(inputId = "type", label = strong("Variável"),
                                choices = unique(names(data[, 3:20])),
                                selected = "densidade_demografica"
                                ),
                   h5("BoxPlot"),
                   p("Medidas descritivas e resumo da distribuição dos dados."),
                   hr(),
                   h5("Summary"),
                   p("Medidas de localização, média, mediana, mínio e máximo."),
                   hr(),
                   h5("Shapiro-Wilk Normality Test"),
                   p("Teste de normalidade, considera-se p-valor > 0.05"),
                   hr(),
                    helpText("Análise descritiva para a região da Associação de Municípios do Auto Uruguai Catarinense.")
                    ),
                  # Output: boxplot
                  mainPanel(
                    column(6,
                           h4("BoxPlot"),
                           plotOutput(outputId = "boxplot")
                           ),
                    column(6,
                           h4("Summary"),
                           verbatimTextOutput("summary"),
                           hr(),
                           br(),
                           h4("Shapiro-Wilk Normality Test"),
                           verbatimTextOutput("shapiro"), 
                    )
                  )
                ),
                
                # Output: view tables
                column(6,
                       hr(),
                       h4("Valores mais altos"),
                       tableOutput("viewhead")
                       ),
                column(6,
                       hr(),
                       h4("Valores mais baixos"),
                       tableOutput("viewtail")
                ),

              )

# Define server function --------------------------------------------------


server <- function(input, output, session) {
  # Subset data
  dados <- reactive({
    data[ , c(input$type)]
  })
  
  dadosview <- reactive({
    data[ ,c("code_muni", "territorialidades", input$type)]
  })
  
  
  # plot
  output$boxplot <- renderPlot({
      boxplot(dados())
    })
  # summary
  output$summary <- renderPrint({
    dataset <- dados()
    summary(dataset)
  })
  
  # shapiro-wilk
  output$shapiro <- renderPrint({
    dataset <- dados()
    shapiro.test(as.matrix(dataset))
  })
  
  # view table
  output$viewhead <- renderTable({
    head(arrange(dadosview(), desc(dados())), 5)
  })
  output$viewtail <- renderTable({
    head(arrange(dadosview(), dados()), 5)
  })

}

# Create Shiny object
shinyApp(ui = ui, server = server)
