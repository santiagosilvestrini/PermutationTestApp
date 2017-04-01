header <- dashboardHeader(
    title = "Permutation Tests",
    ## MESSAGES
    dropdownMenu(
        type = "messages",
        messageItem(
            from = "Universidad Nacional De Rosario",
            message = "FCECON - Escuela de Estadistica",
            href= "http://www.fcecon.unr.edu.ar/web-nueva/estadistica-1"
        ),
        messageItem(
            from = "Documentacion",
            message = "Obtener codigo fuente",
            icon = icon("question"),
            href = "https://github.com/cuenta/permutation-tests"
        ),
        messageItem(
            from = "Errores",
            message = "Reportar errores aqui",
            icon = icon("life-ring"),
            href = "https://github.com/cuenta/permutation-tests/issues"
        )
    )
)