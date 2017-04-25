## INTRODUCCION ----------------------------------------------------------------------
source('intro/ui.R', local=TRUE)

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

## REGRESION ------------------------------------------------------------
source('regresion/ui.R', local=TRUE)

regresion <- tabItem(
    tabName = "regresion",
    regresion.box
)

## ANOVA ------------------------------------------------------------
source('anova/ui.R', local=TRUE)

anova <- tabItem(
    tabName = "anova",
    anova.box
)

## CONCLUSIONES ----------------------------------------------------------------------
source('conclu/ui.R', local=TRUE)

conclu <- tabItem(
    tabName = "conclu",
    conclu.box
)

## REFERENCIAS ------------------------------------------------------------
source('refe/ui.R', local=TRUE)

refe <- tabItem(
    tabName = "refe",
    refe.box
)

## BODY ------------------------------------------------------------------------
body <- dashboardBody(
    #tags$head(includeScript("www/google-analytics.js")),
    tags$script(HTML("$('body').addClass('sidebar-mini');")),
    #tags$head(tags$style(HTML(".small-box {height: 50px}"))),
    tags$head(tags$style(HTML(".small-box {width: 150px}"))),
    tags$head(tags$style(HTML(".small-box .icon-large {font-size: 50px}"))),
    tags$head(tags$style(HTML(".small-box p{font-size: 12px}"))),
    includeCSS("www/custom.css"),
    
    tabItems(
        intro,
        simulador,
        regresion,
        anova,
        conclu,
        refe
    )
)