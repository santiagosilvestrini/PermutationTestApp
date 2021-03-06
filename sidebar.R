# icons:   
# comment-o, exclamation-circle, exclamation-triangle, external-link, warning, 
# mortar-board, gradiation-cap, institution, university, leanpub
# pie-chart, bar-chart, bookmark, area-chart,dashboard, line-chart, random, percent, slack
# bolt, cog, cogs, flask, magic, refresh, spinner, sliders, wrench, 
# download, cloud-download, cloud-upload, upload
# code, code-fork, creative-commons, github, sellsy, linkedin, 
# http://fontawesome.io/icons/

#http://getbootstrap.com/components/#glyphicons
# glyphicon glyphicon-stats, 


# To increase icon sizes relative to their container, use the fa-lg (33% increase), fa-2x, fa-3x, fa-4x, or fa-5x classes.
sidebar <- dashboardSidebar(
    sidebarMenu( id="menuBase",
        menuItem(
            "Introduccion",
            tabName = "intro",
            icon = icon("play", class = "fa-lg")
        ),
        menuItem(
            "Simulador",
            tabName = "simulador",
            badgeLabel = "Santiago", badgeColor = "green",
            icon = icon("flask", class = "fa-lg")
        ),
        menuItem(
            "Regresion Linear",
            tabName = "regresion",
            badgeLabel = "German", badgeColor = "blue",
            icon = icon("line-chart", class = "fa-lg")
        ),
        menuItem(
            "ANOVA",
            tabName = "anova",
            badgeLabel = "Manuel", badgeColor = "yellow",
            icon = icon("area-chart", class = "fa-lg")
        ),
        menuItem(
            "Conclusiones",
            tabName = "conclu",
            icon = icon("bullseye", class = "fa-lg")
        ),
        menuItem(
            "Referencias",
            tabName = "refe",
            icon = icon("leanpub", class = "fa-lg")
        )
    ),
    conditionalPanel(
        condition = "input.menuBase == 'simulador'",
        
        tags$hr(), 
        radioButtons("seedchoice", label="Tipo de Semilla:",
                     choices=c("Aleatoria" = "random", "Fija" = "fixed"),
                     inline=TRUE),
        
        numericInput("seed", 
                     label = "Valor Semilla:", 
                     value = 1234, width = "80%"),
        
        sliderInput("nivelSignificacion", label = HTML("<h4>Nivel de Significacion &alpha;"), 
                    min = 0.01, 
                    max = 0.20, value = 0.05)
    )
)