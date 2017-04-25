#source("../helpers/helpers.R")

simulador.box <- fluidPage(
        tags$head(tags$link(rel = "icon", type = "image/x-icon", 
                        href = "www/favicon.ico")),
        useShinyjs(),
        tags$style(appCSS),
        #tags$script("
         #           MathJax.Hub.Config({
          #          tex2jax: {
           #         inlineMath: [['$','$'], ['\\(','\\)']],
            #        processEscapes: true
             #       }
              #      });"
        #),
        fluidRow(
           
            column(width = 4,
                
                     fluidRow(
                         tabBox( title = "Distribuciones", id = "tabDist", width = NULL, side = "right", height = "200px",
                                 selected = "Grupo A",
                                 tabPanel(title = "Grupo B",
                                          selectInput("selectDistributionB", label = NULL, 
                                                      choices = list("Normal" = 1, "Log Normal" = 2,
                                                                     "Exponencial" = 3, "Chi-Cuadrada" = 4, 
                                                                     "Binomial" = 5, "Uniforme" = 6), selected = 1),
                                          
                                          conditionalPanel(condition = "input.selectDistributionB == 1", #normal
                                                           column(4, numericInput("normal.b.mu", label = HTML("&mu;2"), value = 0)),
                                                           column(4, numericInput("normal.b.sigma", label = HTML("&sigma;2"), value = 1)),
                                                           column(4, numericInput("normal.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 2", #lognormal
                                                           column(4, numericInput("lognormal.b.mu", label = HTML("&mu;2"), value = 0)),
                                                           column(4, numericInput("lognormal.b.sigma", label = HTML("&sigma;2"), value = 1)),
                                                           column(4, numericInput("lognormal.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 3", #Exponencial
                                                           column(4, numericInput("exponencial.b.lambda", label = HTML("&lambda;2"), value = 5)),
                                                           column(4, numericInput("exponencial.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 4", #Chi-Cuadrado
                                                           column(4, numericInput("chi2.b.df", label = "df", value = 5)),
                                                           column(4, numericInput("chi2.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 5", #Binomail
                                                           column(4, numericInput("binomial.b.n", label = "n", value = 5)),
                                                           column(4, numericInput("binomial.b.p", label = "p", value = 0.8)),
                                                           column(4, numericInput("binomial.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 6", #Uniforme
                                                           column(4, numericInput("uniforme.b.min", label = "min", value = 0)),
                                                           column(4, numericInput("uniforme.b.max", label = "max", value = 1)),
                                                           column(4, numericInput("uniforme.b.sample", label = "muestra", value = 5))
                                          )
                                 ),
                                 tabPanel(title = "Grupo A",
                                          selectInput("selectDistributionA", label = NULL, 
                                                      choices = list("Normal" = 1, "Log Normal" = 2,
                                                                     "Exponencial" = 3, "Chi-Cuadrada" = 4, 
                                                                     "Binomial" = 5, "Uniforme" = 6), selected = 1),
                                          
                                          conditionalPanel(condition = "input.selectDistributionA == 1",
                                                           column(4, numericInput("normal.a.mu", label = HTML("&mu;1"), value = 0)),
                                                           column(4, numericInput("normal.a.sigma", label = HTML("&sigma;1"), value = 1)),
                                                           column(4, numericInput("normal.a.sample", label = "muestra", value = 10))
                                          ),
                                          
                                          conditionalPanel(condition = "input.selectDistributionA == 2",
                                                           column(4, numericInput("lognormal.a.mu", label = HTML("&mu;1"), value = 0)),
                                                           column(4, numericInput("lognormal.a.sigma", label = HTML("&sigma;1"), value = 1)),
                                                           column(4, numericInput("lognormal.a.sample", label = "muestra", value = 10))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionA == 3", #Exponencial
                                                           column(4, numericInput("exponencial.a.lambda", label = HTML("&lambda;1"), value = 5)),
                                                           column(4, numericInput("exponencial.a.sample", label = "muestra", value = 10))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionA == 4", #Chi-Cuadrado
                                                           column(4, numericInput("chi2.a.df", label = "df", value = 5)),
                                                           column(4, numericInput("chi2.a.sample", label = "muestra", value = 10))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionA == 5", #Binomail
                                                           column(4, numericInput("binomial.a.n", label = "n", value = 5)),
                                                           column(4, numericInput("binomial.a.p", label = "p", value = 0.8)),
                                                           column(4, numericInput("binomial.a.sample", label = "muestra", value = 10))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionA == 6", #Uniforme
                                                           column(4, numericInput("uniforme.a.min", label = "min", value = 0)),
                                                           column(4, numericInput("uniforme.a.max", label = "max", value = 1)),
                                                           column(4, numericInput("uniforme.a.sample", label = "muestra", value = 10))
                                          )
                                 ),
                                 fluidRow(
                                    column(12, 
                                        actionButton("btnGenerar", "Generar Muestra Aleatoria", width = "100%",
                                                 icon("magic"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                                    )
                                 ), tags$br(),
                                 fluidRow(
                                     column(6, 
                                            textAreaInput("txtTratamiento", 
                                                          label = "Grupo A", 
                                                          value = "19\n22\n25\n26", 
                                                          rows = 6,
                                                          placeholder = "Ingrese sus datos"),
                                            
                                            verbatimTextOutput("TratamientoData")
                                            #div(strong("Desde: "), textOutput("myTimeSeriesfrom", inline = TRUE), strong("Hasta: "), textOutput("myTimeSeriesto", inline = TRUE))
                                     ),
                                     column(6, 
                                            textAreaInput("txtControl", 
                                                          label = "Grupo B", 
                                                          value = "23\n33\n40", 
                                                          rows = 6,
                                                          placeholder = "Ingrese sus datos"),
                                            
                                            verbatimTextOutput("ControlData")
                                     )
                                 ),
                                 fluidRow(
                                     column(12, 
                                            #actionButton("btnCalcularProm", "Calcular Promedios", width = "100%",
                                            #             icon("cogs"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                                            #tags$br(),
                                            
                                            "Estadistico de prueba: Diferencia de promedios", verbatimTextOutput("DiferenciaPromedios")
                                            #valueBoxOutput("diferenciaBox", width = 3)
                                     )
                                 ),
                                 fluidRow(
                                     column(12,
                                            HTML("<b>H0</b>: No hay diferencia significativa entre de ambos grupos"),
                                        "Permutaciones posibles:", verbatimTextOutput("TotalPermutaciones")
                                        #helpText('An irrational number $\\sqrt{2}$ and a fraction $1-\\frac{1}{2}$')
                                     )
                                 ),
                                 
                                 fluidRow(
                                     column(12,
                                         radioButtons("permStyle", "Tipo de Permutacion:", c("Exacta", "Aproximada"), inline = T),
                                         helpText("Seleccione el tipo de permutacion deseada"),
                                 
                                         conditionalPanel(condition = "input.permStyle == 'Exacta'",
                                                          column(6, 
                                                                 actionButton("btnPermutar", "Permutar Paso", width = "100%",
                                                                              icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                                                          ),
                                                          column(6,
                                                                 withBusyIndicatorUI(
                                                                     actionButton("btnPermutarTodos", "Permutar Todos", width = "100%", class = "btn-primary",
                                                                                  icon("bolt"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                                                                 )
                                                          )
                                         ),
                                         
                                         conditionalPanel(condition = "input.permStyle == 'Aproximada'",
                                                          splitLayout(cellWidths = c("50%", "25%", "25%"),  
                                                                      withBusyIndicatorUI(
                                                                          actionButton("btnPermutar2", "Permutar", width = "70%", class = "btn-primary",
                                                                                       icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                                                                      ),
                                                                      tags$p("Cantidad:"),
                                                                      numericInput("numPermu", 
                                                                                   label = NULL, 
                                                                                   value = 100, width = "100%")
                                                          )
                                         )
                                     )
                                 )
                     )),
                
                tags$br()
                
                #box(width = NULL, solidHeader = FALSE, #background = "red", 
                #    htmlOutput("ttest"),
                #    h4(withMathJax("t-statistic = \\(\\frac{\\bar x -\\mu_0}{s_{x}/\\sqrt{n}}\\)"))
                #)
            ),
            column(width = 8,
                   
                   tabBox( title = "Graficos", id = "tabCharts", width = NULL, side = "right",
                           selected = "Boxplot Muestra",
                           tabPanel(title = "Histograma Permutaciones", 
                                    plotlyOutput("plotHistogram", height = "320px"),
                                    sliderInput("xbins", "Intervalos:", 
                                                min = 1, max = 50, value = 20, width = 250)
                           ),
                           tabPanel(title = "t test",
                                    #uiOutput("ttest")
                                    uiOutput("ttest")
                           ),
                           tabPanel(title = "Boxplot Muestra",
                                    plotlyOutput("plotBoxplot")
                           )
                           #tabPanel(title = "CheatSheet",
                            #        withMathJax(uiOutput('CheatSheet'))
                                    #includeMarkdown("intro/machete.md")
                           #)
                   ),
                   
                   fluidRow(
                       column(3, valueBoxOutput("Observado"),
                              bsPopover("Observado","Valor Observado",
                                        "Es la diferencia absoluta entre los promedios de ambos grupos de la muestra original.",
                                        trigger="hover",placement="left")
                       ),
                       column(3, valueBoxOutput("tpvalue"),
                              bsPopover("tpvalue", "t-statistic",
                                        "Un p-value grande indica que fallamos en rechazar H0 y que no hay evidencia para HA, mientras que un p-value pequeño indica que rechazamos H0 y por lo tanto hay evidencia a favor de HA.",
                                        trigger="hover",placement="left", options = list(container = "body"))
                       ),
                       column(3, valueBoxOutput("MayoresCount") ),
                       column(3, valueBoxOutput("MayoresPerc") ),
                            bsPopover("MayoresPerc","P Sombrero",
                                 "Proporción de valores en la distribución permutacional iguales o mayores que el valor del estadístico calculado con los valores observados originalmente",
                                 trigger="hover",placement="left")
                       
                       
                   ),
                   
                   box(width = NULL , solidHeader = TRUE, status = "success", title = "Permutaciones", collapsible = TRUE, #background = "red", 
                        column(12,
                               DT::dataTableOutput("TablaPermutaciones")
                        )
                        
                   )
                   
            )
        )
    )
