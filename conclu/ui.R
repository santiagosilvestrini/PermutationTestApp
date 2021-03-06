## CONCLUSIONES

conclu.box <- fluidPage(
    #withMathJax(uiOutput('markdown'))
    fluidRow(
        
        box(width = NULL , solidHeader = TRUE, status = "success", title = "�Qu� es y para qu� sirve un Test Permutacional?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("Un test permutacional calcula la probabilidad de obtener un valor igual o mayor que el valor observado de un estad�stico bajo alguna hip�tesis nula especifica mediante el rec�lculo del estad�stico despu�s de reordenamientos de los datos."),
            HTML("Sirve para testear muchas hip�tesis de inter�s las cuales se las puede pensar  como alternativas a hip�tesis nulas que indican que existen solo efectos del azar en las observaciones.")
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "�En qu� se basa o se fundamenta?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("El argumento propuesto es que <b>si la hip�tesis nula es cierta, luego todo los  posibles ordenamientos de los datos tendr�an las mismas chances de ocurrir</b>. Entonces, el ordenamiento de datos observado es s�lo uno de los ordenamientos igualmente probables, y el valor del estad�stico obtenido deber�a aparecer como un valor t�pico dentro de la distribuci�n permutacional del estad�stico.")
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "�Sobre qu� tipos de fen�menos aleatorios se aplica?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("Se aplica en fen�menos biol�gico y ecol�gicos, tanto para estudios observacionales y  experimentales."),
            HTML("Para datos observacionales debemos suponer intercambiabilidad bajo la hip�tesis nula y para datos experimentales la validez del procedimiento se logra mediante la asignaci�n al azar de los tratamientos.")
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "�Cu�les son los pasos para su ejecuci�n?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            tags$ul(
                tags$li(HTML("Se define una <b>hip�tesis nula</b> y un <b>estad�stico de prueba</b>  apropiado")),
                tags$li(HTML("Se realizan los <b>reordenamientos o permutaciones asumiendo hip�tesis nula cierta</b>. De cada uno de estos ordenamientos, se calculan el valor del estad�stico de prueba.")),
                tags$li(HTML("En caso de ser computacionalmente factible calcular todos los ordenamientos posibles, podremos realizar un <b>test exacto</b> . En caso contrario, se deber� realizar un <b>test aproximado</b>  tomando una muestra aleatoria de los ordenamientos posibles.")),
                tags$li(HTML("Se calcula <b>p-value como la proporci�n de valores en la distribuci�n permutacional iguales o mayores que el valor del estad�stico calculado con los valores observados</b>  originalmente. Este valor, es puede ser interpretado de la misma forma que en test convencionales."))
            )
        ),
        box(width = NULL , solidHeader = TRUE, status = "success", title = "�Cu�les son sus ventajas y desventajas?", collapsible = TRUE,collapsed = FALSE, #background = "red", 
            HTML("Los test permutacionales <b>no descansan sobre supuestos tan estrictos como lo hacen los tests param�tricos</b>. Por lo tanto son de aplicaci�n a mayor n�mero de situaciones pr�cticas que tratan con circunstancias complejas encontradas por los biologos y ecologistas."),
            HTML("Como desventajas, podemos decir que <b>las conclusiones no necesariamente son posibles de generalizar a la poblaci�n de inter�s</b>. Las conclusiones se limitan a los datos observados.")
        )
    )
)