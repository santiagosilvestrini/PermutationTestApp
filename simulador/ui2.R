simulador.box <- fluidPage(
        useShinyjs(),
        fluidRow(
            column(width = 4,
                box( solidHeader = FALSE, status = "danger", title = "Datos", #background = "red", 
                 
                     column(2, 
                             textAreaInput("txtTratamiento", 
                                           label = "Grupo A", 
                                           value = "19\n22\n25\n26", 
                                           rows = 6,
                                           placeholder = "Ingrese sus datos"),
                            
                             verbatimTextOutput("TratamientoData")
                             #div(strong("Desde: "), textOutput("myTimeSeriesfrom", inline = TRUE), strong("Hasta: "), textOutput("myTimeSeriesto", inline = TRUE))
                     ),
                     column(2, 
                            textAreaInput("txtControl", 
                                          label = "Grupo B", 
                                          value = "23\n33\n40", 
                                          rows = 6,
                                          placeholder = "Ingrese sus datos"),
                            
                            verbatimTextOutput("ControlData")
                     ),
                     
                     actionButton("btnCalcularProm", "Calcular Promedios", width = "50%",
                                  icon("paper-plane"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                     tags$br(),
                     
                     "Diferencia de promedios:", verbatimTextOutput("DiferenciaPromedios"),
                     #valueBoxOutput("diferenciaBox", width = 3)
                     h4("H0: No hay diferencia significativa entre de ambos grupos")
    
                ),
                box(solidHeader = FALSE, status = "danger", #background = "red", 
                     "Permutaciones posibles:", verbatimTextOutput("TotalPermutaciones"),
                     
                     #uiOutput("perm_button"),
                     
                     actionButton("btnPermutar", "Permutar", width = "50%",
                                  icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                     
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
                )
            ),
            
            column(width = 8,
            
                box( solidHeader = FALSE, status = "danger", title = "Permutaciones", #background = "red", 
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
                
                box( solidHeader = FALSE,
                     valueBoxOutput("Observado"),
                     valueBoxOutput("MayoresCount"),
                     valueBoxOutput("MayoresPerc")
                )
            )
            
        )
        
        #fluidRow(
           
            #valueBoxOutput("diferenciaBox2", width = 4),
            #valueBoxOutput("diferenciaBox3", width = 4)
        #)

    )
