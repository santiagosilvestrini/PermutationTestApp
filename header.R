header <- dashboardHeader(
    title = "Permutational Tests",
    ## MESSAGES
    dropdownMenu(
        type = "messages",
        messageItem(
            from = "Universidad Nacional De Rosario",
            message = "FCECON - Escuela de Estadistica",
            icon = icon("university"),
            href= "http://www.fcecon.unr.edu.ar/web-nueva/estadistica-1"
        ),
        messageItem(
            from = "Documentacion",
            message = "Obtener codigo fuente",
            icon = icon("github"),
            href = "https://github.com/santiagosilvestrini/PermutationTestApp"
        ),
        messageItem(
            from = "Errores",
            message = "Reportar errores aqui",
            icon = icon("bug"),
            href = "https://github.com/santiagosilvestrini/PermutationTestApp/issues"
        )
    )
)