#REFERENCIAS
output$referencias <- renderUI({
    withMathJax(HTML(markdown::markdownToHTML(knit('refe/referencias.Rmd', quiet = TRUE))))
})