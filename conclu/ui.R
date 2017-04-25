## CONCLUSIONES

conclu.box <- fluidPage(
    #withMathJax(uiOutput('markdown'))
    fluidRow(
        
        box(width = NULL , solidHeader = TRUE, status = "success", title = "¿Qué es y para qué sirve un Test Permutacional?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("Un test permutacional calcula la probabilidad de obtener un valor igual o mayor que el valor observado de un estadístico bajo alguna hipótesis nula especifica mediante el recálculo del estadístico después de reordenamientos de los datos."),
            HTML("Sirve para testear muchas hipótesis de interés las cuales se las puede pensar  como alternativas a hipótesis nulas que indican que existen solo efectos del azar en las observaciones.")
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "¿En qué se basa o se fundamenta?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("El argumento propuesto es que <b>si la hipótesis nula es cierta, luego todo los  posibles ordenamientos de los datos tendrían las mismas chances de ocurrir</b>. Entonces, el ordenamiento de datos observado es sólo uno de los ordenamientos igualmente probables, y el valor del estadístico obtenido debería aparecer como un valor típico dentro de la distribución permutacional del estadístico.")
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "¿Sobre qué tipos de fenómenos aleatorios se aplica?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("Se aplica en fenómenos biológico y ecológicos, tanto para estudios observacionales y  experimentales."),
            HTML("Para datos observacionales debemos suponer intercambiabilidad bajo la hipótesis nula y para datos experimentales la validez del procedimiento se logra mediante la asignación al azar de los tratamientos.")
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "¿Cuáles son los pasos para su ejecución?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            tags$ul(
                tags$li(HTML("Se define una <b>hipótesis nula</b> y un <b>estadístico de prueba</b>  apropiado")),
                tags$li(HTML("Se realizan los <b>reordenamientos o permutaciones asumiendo hipótesis nula cierta</b>. De cada uno de estos ordenamientos, se calculan el valor del estadístico de prueba.")),
                tags$li(HTML("En caso de ser computacionalmente factible calcular todos los ordenamientos posibles, podremos realizar un <b>test exacto</b> . En caso contrario, se deberá realizar un <b>test aproximado</b>  tomando una muestra aleatoria de los ordenamientos posibles.")),
                tags$li(HTML("Se calcula <b>p-value como la proporción de valores en la distribución permutacional iguales o mayores que el valor del estadístico calculado con los valores observados</b>  originalmente. Este valor, es puede ser interpretado de la misma forma que en test convencionales."))
            )
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "¿Cuáles son sus ventajas y desventajas?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("Los test permutacionales <b>no descansan sobre supuestos tan estrictos como lo hacen los tests paramétricos</b>. Por lo tanto son de aplicación a mayor número de situaciones prácticas que tratan con circunstancias complejas encontradas por los biologos y ecologistas."),
            HTML("Como desventajas, podemos decir que <b>las conclusiones no necesariamente son posibles de generalizar a la población de interés</b>. Las conclusiones se limitan a los datos observados.")
        )
    )
)