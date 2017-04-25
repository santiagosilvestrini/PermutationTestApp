server <- function(input, output, session) {
    session$onSessionEnded(stopApp)
    
    ## SIMULADOR --------------------------------------------------------------------
    source("simulador/server.R", local=TRUE)
    
    
    ## INTRO --------------------------------------------------------------------
    source("intro/server.R", local=TRUE)
    
    
    ## regresion --------------------------------------------------------------------
    source("regresion/server.R", local=TRUE)
    
    ## REFERENCIAS --------------------------------------------------------------------
    source("anova/server.R", local=TRUE)
    
    ## REFERENCIAS --------------------------------------------------------------------
    source("refe/server.R", local=TRUE)
}
