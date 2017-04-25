# Regresion
output$markdownRegre <- renderUI({
    withMathJax(HTML(markdown::markdownToHTML(knit('regresion/linearRegrPerm.Rmd', quiet = TRUE))))
})