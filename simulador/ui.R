simulador.box <- fluidPage(
        useShinyjs(),
        fluidRow(
           
            column(width = 4,
                box( width = NULL, solidHeader = FALSE, status = "danger", title = "Datos", #background = "red", 
                 
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
                     ),
                     column(12, 
                            actionButton("btnCalcularProm", "Calcular Promedios", width = "50%",
                                         icon("paper-plane"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                            tags$br(),
                            
                            "Diferencia de promedios:", verbatimTextOutput("DiferenciaPromedios")
                            #valueBoxOutput("diferenciaBox", width = 3)
                    )
                ),
                
                box(width = NULL, solidHeader = FALSE, status = "danger", #background = "red", 
                    
                    h4("H0: No hay diferencia significativa entre de ambos grupos"),
                    
                    "Permutaciones posibles:", verbatimTextOutput("TotalPermutaciones"),
                    
                    #uiOutput("perm_button"),
                    
                    radioButtons("permStyle", "Tipo de Permutacion:", c("Exacta", "Aproximada"), inline = T),
                    helpText("Seleccione el tipo de permutacion deseada"),
                    
                    conditionalPanel("input.permStyle === 'Exacta'",
                        actionButton("btnPermutar", "Permutar", width = "50%",
                                      icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                    ),
                    
                    conditionalPanel("input.permStyle === 'Aproximada'",
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
                   box(width = NULL , solidHeader = FALSE, status = "danger", title = "Permutaciones", #background = "red", 
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