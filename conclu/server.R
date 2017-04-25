# CONCLUSIONES
output$markdown <- renderUI({
    withMathJax(HTML(markdown::markdownToHTML(knit('intro/intro_test.Rmd', quiet = TRUE))))
})