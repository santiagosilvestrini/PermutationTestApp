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

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            "Introduccion",
            tabName = "intro",
            icon = icon("play")
        ),
        menuItem(
            "Simulador",
            tabName = "simulador",
            icon = icon("flask")
        ),
        menuItem(
            "Regresion Linear",
            tabName = "regresion",
            icon = icon("line-chart")
        ),
        menuItem(
            "ANOVA",
            tabName = "anova",
            icon = icon("area-chart")
        ),
        menuItem(
            "Referencias",
            tabName = "refe",
            icon = icon("leanpub")
        )
    )
)