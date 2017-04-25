#REFERENCIAS
refe.box <- fluidPage(
    #withMathJax(uiOutput('referencias'))
    fluidRow(
        box(width = 12 , solidHeader = TRUE, status = "info", title = "Bibliografia", collapsible = FALSE, #background = "red", 
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("file-text"),
                        HTML("<a href='http://www.nrcresearchpress.com/doi/abs/10.1139/f01-004'>Permutation tests for univariate or multivariate analysis of variance and regression</a> Canadian Journal of Fisheries and Aquatic Sciences, 2001, 58(3)")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("book"),
                        HTML("<a href='https://www.amazon.es/Randomization-Bootstrap-Methods-Biology-Statistical/dp/1584885416'>Randomization, Bootstrap and Monte Carlo Methods in Biology, Third Edition</a>")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("file-text"),
                        HTML("<a href='http://www.nrcresearchpress.com/doi/abs/10.1139/z84-066'>The diet of the eastern short-horned lizard (Phrynosoma douglassi brevirostre) in Alberta and its relationship to sexual size dimorphism</a>")
            )
        ),
        box(width = 12 , solidHeader = TRUE, status = "primary", title = "Material Extra", collapsible = FALSE, #background = "red", 
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("video-camera"),
                        HTML("Lloyd Rieber <a href='https://www.youtube.com/watch?v=GmvpsJHGCxQ'>An Introduction to the Permutation Test</a>")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("wikipedia-w"),
                        HTML("<a href='https://en.wikipedia.org/wiki/Resampling_(statistics)#Permutation_tests'>Permutation Tests (Wikipedia)</a>")
                        
                        
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("video-camera"),
                        HTML("<a href='https://es.coursera.org/learn/statistical-inference/lecture/Nmd6U/13-04-permutation-tests'>Lecture 40 - 13 04 Permutation Test</a> parte del <a href='https://es.coursera.org/learn/statistical-inference'>Statistical Inference Course</a> de la Johns Hopkins University en Coursera.")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("link"),
                        HTML("Jared Wilber (UC Berkeley) <a href='https://jwilber.github.io/2017/01/12/Permutation-Test-Explanation-And-Implementation-In-R.html'>Permutation Test: Explanation and Implementation in R</a>")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                         icon("database"),
                         HTML("<a href='http://college.cengage.com/mathematics/brase/understandable_statistics/7e/students/datasets/slr/frames/frame.html'>Statistical Abstract of the United States</a>")
            )
            
        ),
        box(width = 12 , solidHeader = TRUE, status = "warning", title = "Paquetes R y otras herramientas", collapsible = FALSE, #background = "red", 
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/shiny/index.html'>shiny</a>: Web Application Framework for R")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/shinydashboard/index.html'>shinydashboard</a>: This package provides a theme on top of 'Shiny', making it easy to create attractive dashboards.")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/markdown/index.html'>markdown</a>: 'Markdown' Rendering for R")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/combinat/index.html'>combinat</a>: combinatorics utilities")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/shinyjs/vignettes/shinyjs.html'>shinyjs</a>: Easily improve the user interaction and user experience in your Shiny apps in seconds")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/HistData/index.html'>HistData</a>: Data Sets from the History of Statistics and Data Visualization")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/mcsm/index.html'>mcsm</a>: Functions for Monte Carlo Methods with R")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/ggplot2/index.html'>ggplot2</a>: Create Elegant Data Visualisations Using the Grammar of Graphics")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/plotly/plotly.pdf'>plotly</a>: Easily translate 'ggplot2' graphs to an interactive web-based version and/or create custom
web-based visualizations directly from R")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/shinyBS/index.html'>shinyBS</a>: Twitter Bootstrap Components for Shiny")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/knitr/index.html'>knitr</a>:  A General-Purpose Package for Dynamic Report Generation in R")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/lmPerm/index.html'>lmPerm</a>: Permutation Tests for Linear Models")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/coin/index.html'>coin</a>:Conditional Inference Procedures in a Permutation Test Framework" )
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("archive"),
                        HTML("<a href='https://cran.r-project.org/web/packages/perm/index.html'>perm</a>: Exact or Asymptotic permutation tests")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("wrench"),
                        HTML("<a href='https://www.codecogs.com/latex/eqneditor.php'>Online LaTeX Equation Editor</a>")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("wrench"),
                        HTML("<a href='http://fontawesome.io/icons/'>Font Awesome Icons Collection</a>")
            )
            
        ),
        box(width = 12 , solidHeader = TRUE, status = "info", title = "Quienes Somos", collapsible = FALSE, #background = "red", 
            splitLayout(cellWidths = c("20%", "5%", "75%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        img(src='german.png', align = "right", width = "100px"),
                        icon("linkedin"),
                        HTML("<a href='https://www.linkedin.com/in/germanbeltzer/'>Ing. German Beltzer</a>")
            ),
            splitLayout(cellWidths = c("20%", "5%", "75%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        img(src='manuel.png', align = "right", width = "100px"),
                        icon("linkedin"),
                        HTML("<a href='https://ar.linkedin.com/in/manuel-mancilla-764a9bb3'>Dr. Manuel A. Mancilla Canales</a>")
                        
            ),
            splitLayout(cellWidths = c("20%", "5%", "75%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        img(src='santi.png', align = "right", width = "100px"),
                        icon("linkedin"),
                        HTML("<a href='https://www.linkedin.com/in/ssilvestrini/'>Ing. Santiago Silvestrini</a>")
            ),
            splitLayout(cellWidths = c("5%", "98%"),  cellArgs = list(style = "padding: 2px", scrollY = F),
                        icon("university"),
                        HTML("<a href='http://www.fcecon.unr.edu.ar/web-nueva/estadistica-1'>FCECON - Escuela de Estadistica</a> Universidad Nacional De Rosario")
            )
        )
    )
    
)