# anova
output$markdownAnova <- renderUI({
    withMathJax(HTML(markdown::markdownToHTML(knit('anova/anova.Rmd', quiet = TRUE))))
})
