## INTRODUCCION ----------------------------------------------------------------------
source('intro/intro.R', local=TRUE)

intro <- tabItem(
    tabName = "intro",
    intro.box
)

## SIMULADOR ------------------------------------------------------------
source('simulador/ui.R', local=TRUE)

simulador <- tabItem(
    tabName = "simulador",
    simulador.box
)

## SIMULADOR ------------------------------------------------------------
source('regresion/ui.R', local=TRUE)

regresion <- tabItem(
    tabName = "regresion",
    regresion.box
)

## SIMULADOR ------------------------------------------------------------
source('anova/ui.R', local=TRUE)

anova <- tabItem(
    tabName = "anova",
    anova.box
)

## REFERENCIAS ------------------------------------------------------------
source('refe/refe.R', local=TRUE)

refe <- tabItem(
    tabName = "refe",
    refe.box
)

## BODY ------------------------------------------------------------------------
body <- dashboardBody(
    #tags$head(includeScript("www/google-analytics.js")),
    tags$script(HTML("$('body').addClass('sidebar-mini');")),
    #tags$head(tags$style(HTML(".small-box {height: 50px}"))),
    tags$head(tags$style(HTML(".small-box {width: 200px}"))),
    tags$head(tags$style(HTML(".small-box .icon-large {font-size: 50px}"))),
    includeCSS("www/custom.css"),
    
    tabItems(
        intro,
        simulador,
        regresion,
        anova,
        refe
    )
)