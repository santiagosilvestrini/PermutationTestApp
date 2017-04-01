server <- function(input, output, session) {
    session$onSessionEnded(stopApp)
    
    ## SIMILADOR --------------------------------------------------------------------
    source("simulador/server.R", local=TRUE)
    
    
    ## UPLOAD --------------------------------------------------------------------
    #source("fileUpload/server.R", local=TRUE)
    
    ## CLUSTER --------------------------------------------------------------------
    #source("clustering/server.R", local=TRUE)
    
    ## RANKING --------------------------------------------------------------------
    #source("ranking/server.R", local=TRUE)
}
