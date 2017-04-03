simulador.box <- fluidPage(
        useShinyjs(),
        fluidRow(
           
            column(width = 4,
                
                     fluidRow(
                         tabBox( title = "Distribuciones", id = "tabDist", width = NULL, side = "right", height = "200px",
                                 selected = "Grupo A",
                                 tabPanel(title = "Grupo B",
                                          selectInput("selectDistributionB", label = NULL, 
                                                      choices = list("Normal" = 1, "Log Normal" = 2,
                                                                     "Exponencial" = 3, "Chi-Cuadrada" = 4, "Binomial" = 5), selected = 1),
                                          
                                          conditionalPanel(condition = "input.selectDistributionB == 1", #normal
                                                           column(4, numericInput("normal.b.mu", label = "mu", value = 0)),
                                                           column(4, numericInput("normal.b.sigma", label = "s", value = 1)),
                                                           column(4, numericInput("normal.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 2", #lognormal
                                                           column(4, numericInput("lognormal.b.mu", label = "mu", value = 0)),
                                                           column(4, numericInput("lognormal.b.sigma", label = "s", value = 1)),
                                                           column(4, numericInput("lognormal.b.sample", label = "muestra", value = 5))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionB == 3", #Exponencial
                                                           column(4, numericInput("exponencial.b.lambda", label = "lambda", value = 5)),
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
                                          )
                                 ),
                                 tabPanel(title = "Grupo A",
                                          selectInput("selectDistributionA", label = NULL, 
                                                      choices = list("Normal" = 1, "Log Normal" = 2,
                                                                     "Exponencial" = 3, "Chi-Cuadrada" = 4, "Binomial" = 5), selected = 1),
                                          
                                          conditionalPanel(condition = "input.selectDistributionA == 1",
                                                           column(4, numericInput("normal.a.mu", label = "mu", value = 0)),
                                                           column(4, numericInput("normal.a.sigma", label = "s", value = 1)),
                                                           column(4, numericInput("normal.a.sample", label = "muestra", value = 10))
                                          ),
                                          
                                          conditionalPanel(condition = "input.selectDistributionA == 2",
                                                           column(4, numericInput("lognormal.a.mu", label = "mu", value = 0)),
                                                           column(4, numericInput("lognormal.a.sigma", label = "s", value = 1)),
                                                           column(4, numericInput("lognormal.a.sample", label = "muestra", value = 10))
                                          ),
                                          conditionalPanel(condition = "input.selectDistributionA == 3", #Exponencial
                                                           column(4, numericInput("exponencial.a.lambda", label = "lambda", value = 5)),
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
                                          )
                                 )
                     )),
                     fluidRow(
                        column(6, 
                            actionButton("btnGenerar", "Generar", width = "100%",
                                     icon("magic"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                        )
                     ),
                    box( width = NULL, solidHeader = FALSE, status = "danger", title = "Datos", #background = "red", 
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
                                actionButton("btnCalcularProm", "Calcular Promedios", width = "100%",
                                             icon("cogs"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                                tags$br(),
                                
                                "Diferencia de promedios:", verbatimTextOutput("DiferenciaPromedios")
                                #valueBoxOutput("diferenciaBox", width = 3)
                        )
                     )
                ),
                
                box(width = NULL, solidHeader = FALSE, status = "danger", #background = "red", 
                    
                    h4("H0: No hay diferencia significativa entre de ambos grupos"),
                    
                    "Permutaciones posibles:", verbatimTextOutput("TotalPermutaciones"),
                    
                    #uiOutput("perm_button"),
                    
                    radioButtons("permStyle", "Tipo de Permutacion:", c("Exacta", "Aproximada"), inline = T),
                    helpText("Seleccione el tipo de permutacion deseada"),
                    
                    conditionalPanel(condition = "input.permStyle == 'Exacta'",
                        actionButton("btnPermutar", "Permutar Paso", width = "40%",
                                      icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                        
                        actionButton("btnPermutarTodos", "Permutar Todos", width = "40%",
                                     icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                    ),
                    
                    conditionalPanel(condition = "input.permStyle == 'Aproximada'",
                                splitLayout(cellWidths = c("50%", "25%", "25%"),  
                                     actionButton("btnPermutar2", "Permutar", width = "100%",
                                                  icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                                     tags$p("Cantidad:"),
                                     numericInput("numPermu", 
                                                  label = NULL, 
                                                  value = 100, width = "100%")
                                )
                    )
                    
                    
                    # 
                    # h3("Help text"),
                    # helpText("Note: help text isn't a true widget,", 
                    #          "but it provides an easy way to add text to",
                    #          "accompany other widgets."),
                    # 
                    # textInput("txtIteraciones", 
                    #           label = "Iteraciones", 
                    #           value = "1")
                    # 
                ),
                box(width = NULL, solidHeader = FALSE, #background = "red", 
                    htmlOutput("ttest")
                )
            ),
            column(width = 8,
                   box(width = NULL , solidHeader = TRUE, status = "success", title = "Permutaciones", collapsible = TRUE, #background = "red", 
                        #h2('The mtcars data'),
                        #DT::dataTableOutput("TablaPermutaciones")
                        
                        column(3,
                               textAreaInput("txtGrupoA",
                                             label = "Grupo A",
                                             value = "",
                                             rows = 10,
                                             placeholder = "")
                        ),
                        column(3,
                               textAreaInput("txtGrupoB",
                                             label = "Grupo B",
                                             value = "",
                                             rows = 10,
                                             placeholder = "")
                        ),
                        column(2,
                               textAreaInput("txtMeanA",
                                             label = "PromA",
                                             value = "",
                                             rows = 10,
                                             placeholder = "")
                        ),
                        column(2,
                               textAreaInput("txtMeanB",
                                             label = "PromB",
                                             value = "",
                                             rows = 10,
                                             placeholder = "")
                        ),
                        column(2,
                               textAreaInput("txtDifPromAB",
                                             label = "|Dif|",
                                             value = "",
                                             rows = 10,
                                             placeholder = "")
                        )
                   ),
                   
                   box( width = NULL, solidHeader = FALSE,
                        valueBoxOutput("Observado"),
                        valueBoxOutput("MayoresCount"),
                        valueBoxOutput("MayoresPerc")
                   ),
                   tabBox( title = "Graficos", id = "tabCharts", width = NULL, side = "right",
                           selected = "Histograma",
                           tabPanel(title = "Densidad",
                                    plotOutput("plotDensity")
                           ),
                           tabPanel(title = "Histograma",
                                    plotlyOutput("plotHistogram"),
                                    sliderInput("xbins", "Cantidad de bins", 
                                                min = 1, max = 50, value = 20, width = 250)
                           )
                   )
                   
            )
        )
    )
