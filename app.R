## Run locally if in interactive session (for testing)
if(interactive()) {
    source("global.R")
    source("ui.R")
    source("server.R") ## function(input, out)
    shinyApp(ui, server)
}

## or Deploy App
## shinyapps::deployApp(appName="CienciasDeDatos-PermutationTests", account="myaccount")
