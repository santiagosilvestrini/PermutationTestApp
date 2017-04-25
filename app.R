## para que corrar local:
if(interactive()) {
    source("global.R")
    source("ui.R")
    source("server.R") ## function(input, out)
    shinyApp(ui, server)
}

##  o para deployar la app
## shinyapps::deployApp(appName="CienciasDeDatos-PermutationTests", account="myaccount")
## library(rsconnect)
## rsconnect::setAccountInfo(name='santi', token='', secret='')
## deployApp()