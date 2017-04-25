## INTRO

intro.box <- fluidPage(
    #withMathJax(uiOutput('markdown'))
    fluidRow(
        
        box(width = NULL , solidHeader = TRUE, status = "success", title = "Breve Introducción", collapsible = TRUE,collapsed = TRUE, #background = "red", 
            ""#withMathJax(uiOutput('markdown'))
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "Simulador Permutacional", collapsible = TRUE,collapsed = TRUE, #background = "red", 
            ""#withMathJax(uiOutput('markdown'))
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "Regresión Lineal", collapsible = TRUE,collapsed = TRUE, #background = "red", 
            ""#withMathJax(uiOutput('markdown'))
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "ANOVA", collapsible = TRUE,collapsed = TRUE, #background = "red", 
            ""#withMathJax(uiOutput('markdown'))
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "Conclusiones", collapsible = TRUE,collapsed = TRUE, #background = "red", 
            ""#withMathJax(uiOutput('markdown'))
        )
    )
    
)