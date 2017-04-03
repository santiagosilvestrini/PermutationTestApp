# Resources
source("helpers/custom_functions.R") 

# On Load
shinyjs::disable("btnPermutar")
shinyjs::disable("btnPermutarTodos")
shinyjs::disable("btnPermutar2") 

# [ToDo] Put some order below!

output$TratamientoData <- renderText({ paste0("Promedio: ", as.character(mean(vecTratamiento()))) })
output$ControlData <- renderText({ paste0("Promedio: ", as.character(mean(vecControl()))) })
output$DiferenciaPromedios <- renderText({ as.character(mean(vecTratamiento()) - mean(vecControl())) })

output$ttest <- renderUI({ 
    ga <- vecTratamiento()
    gb <- vecControl()

    ttest <- t.test(ga, gb)
   
    HTML(paste0("<b>t.test p-value: </b>", ttest$p.value, "<br/><b>t statistc: </b>", ttest$statistic))
    #ttest$statistic
    #ttest$conf.int
    #ttest$alternative
})

vecTodos <- eventReactive(input$btnCalcularProm, {
    c(vecTratamiento(), vecControl())
})

output$TotalPermutaciones <- renderText({ 
    paste0(control$PermStep, "/", totalPermu())
})

totalPermu <- reactive({ 
    dim(combn(vecTodos(),numGrupoA()))[2] 
})

diff.Absoluta <- reactive({ abs(mean(vecTratamiento()) - mean(vecControl())) })

numGrupoA <- reactive({ 
    length(as.numeric(unlist(strsplit(input$txtTratamiento, split="\n"))))
})    

numGrupoB <- reactive({ 
    length(as.numeric(unlist(strsplit(input$txtControl, split="\n")))) 
})

todas <- eventReactive(input$btnCalcularProm, {
    combn(vecTodos(),numGrupoA())
})

#length(permn(3))
#dim(combn(3,2))[2]
#varTratamientoMean <- c(19, 22, 25, 26)
#varControlMean <- c(23, 33, 40)
#todos <- c(varTratamientoMean, varControlMean)

vecTratamiento <- eventReactive(input$btnCalcularProm, {
    #print("boton1")
    shinyjs::enable("btnPermutar")
    shinyjs::enable("btnPermutarTodos")
    shinyjs::enable("btnPermutar2") 
    as.numeric(unlist(strsplit(input$txtTratamiento, split="\n")))
})

vecControl <- eventReactive(input$btnCalcularProm, {
    as.numeric(unlist(strsplit(input$txtControl, split="\n")))
})


#output$perm_button <- renderUI({
#    actionButton("btnPermutar", label = paste0("Permutar (", as.character(input$btnPermutar[1]) ,"/", as.character(totalPermu()), ")" ),
#                 width = "50%", icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
#})

observeEvent(input$btnGenerar, {
    aValues <- NULL
    bValues <- NULL
    switch(input$selectDistributionA, 
           "1"={
               aValues <- round(rnorm(n = input$normal.a.sample, mean = input$normal.a.mu, sd = input$normal.a.sigma), 2)
           },
           "2"={
               aValues <- round(rlnorm(n = input$lognormal.a.sample, mean = input$lognormal.a.mu, sd = input$lognormal.a.sigma), 2)
           },
           "3"={
               aValues <- round(rexp(n = input$exponencial.a.sample, rate = input$exponencial.a.lambda), 2)
           },
           "4"={
               aValues <- round(rchisq(n = input$chi2.a.sample, df = input$chi2.a.df), 2)
           },
           "5"={
               aValues <- round(rbinom(size = input$binomial.a.sample, n = input$binomial.a.n, prob = input$binomial.a.p), 2)
           },
           {
               print(paste0("Adefault:", input$selectDistributionA))
           }
    )
    
    switch(input$selectDistributionB, 
           "1"={
               bValues <- round(rnorm(n = input$normal.b.sample, mean = input$normal.b.mu, sd = input$normal.b.sigma), 2)
           },
           "2"={
               bValues <- round(rlnorm(n = input$lognormal.b.sample, mean = input$lognormal.b.mu, sd = input$lognormal.b.sigma), 2)
           },
           "3"={
               bValues <- round(rexp(n = input$exponencial.b.sample, rate = input$exponencial.b.lambda), 2)
           },
           "4"={
               bValues <- round(rchisq(n = input$chi2.b.sample, df = input$chi2.b.df), 2)
           },
           "5"={
               bValues <- round(rbinom(size = input$binomial.b.sample, n = input$binomial.b.n, prob = input$binomial.b.p), 2)
           },
           {
               print(paste0("Bdefault:", input$selectDistributionB))
           }
    )
    
    updateTextAreaInput(session, "txtTratamiento", value = paste(as.character(aValues), collapse="\n"))
    updateTextAreaInput(session, "txtControl", value = paste(as.character(bValues), collapse="\n"))
})

observeEvent(input$btnPermutar, {
    btnClick <- input$btnPermutar[1]
    
    control$PermStep <- control$PermStep + 1
    
    #print(paste0("totalPermu:", totalPermu()))
    
    if(control$PermStep == totalPermu()) shinyjs::disable("btnPermutar")
    
    if (control$PermStep <= totalPermu()){
        newga <- todas()[,control$PermStep]
        #print(paste0("vecTodos:", vecTodos()))
        newgb <- vecTodos()[vecTodos() %nin% newga]
        #print(paste0("newgb:", newgb))
        
        newgaC <- paste(as.character(newga), collapse=",")
        newgbC <- paste(as.character(newgb), collapse=",")
        
        if(control$PermStep > 1){
            ga <- input$txtGrupoA
            gb <- input$txtGrupoB
            ma <- input$txtMeanA
            mb <- input$txtMeanB
            dm <- input$txtDifPromAB
        }else{
            meanDiff$results <- NULL
            ga <- NULL
            gb <- NULL
            ma <- NULL
            mb <- NULL
            dm <- NULL
        }
        updateTextAreaInput(session, "txtGrupoA", value = paste0(ga, newgaC, "\n" ))
        updateTextAreaInput(session, "txtGrupoB", value = paste0(gb, newgbC, "\n" ))
        updateTextAreaInput(session, "txtMeanA", value = paste0(ma, round(mean(newga),2), "\n" ))
        updateTextAreaInput(session, "txtMeanB", value = paste0(mb, round(mean(newgb),2), "\n" ))
        updateTextAreaInput(session, "txtDifPromAB", value = paste0(dm, round(abs(mean(newga)-mean(newgb)),2), "\n" ))
        
        vDiff <- mean(newga)-mean(newgb)
        meanDiff$results[control$PermStep] <- vDiff
        
        
    }

        
})

observeEvent(input$btnPermutarTodos, {
    control$PermStep <- 0
    meanDiff$results <- NULL
    
    selected <- todas()
    
    print(length(todas()))
    
    vDiff <- rep(0, length(todas()))
    
    print(paste0("totalPermu:", totalPermu()))
    print(paste0("dim(todas()):", dim(todas())))
    print(paste0("length(todas()):", length(todas())))
    print(paste0("length(selected:", length(selected)))
                 
    for (i in 1:totalPermu()) {
        #print(paste0("i:", i))
        newga <- selected[,i]
        newgb <- vecTodos()[vecTodos() %nin% selected[,i]]
        
        newgaC <- paste(as.character(newga), collapse=",")
        newgbC <- paste(as.character(newgb), collapse=",")
        
        
        if(i == 1){
            ga <- paste0(newgaC, "\n" )
            gb <- paste0(newgbC, "\n" )
            ma <- paste0(round(mean(newga),2), "\n" )
            mb <- paste0(round(mean(newgb),2), "\n" )
            dm <- paste0(round(abs(mean(newga)-mean(newgb)),2), "\n" )
        }else{
            ga <- paste0(ga, newgaC, "\n" )
            gb <- paste0(gb, newgbC, "\n" )
            ma <- paste0(ma, round(mean(newga),2), "\n" )
            mb <- paste0(mb, round(mean(newgb),2), "\n" )
            dm <- paste0(dm, round(abs(mean(newga)-mean(newgb)),2), "\n" )
        }
        
        vDiff[i] <- mean(newga)-mean(newgb)
        
    }
    meanDiff$results <- vDiff
    
    updateTextAreaInput(session, "txtGrupoA", value = ga)
    updateTextAreaInput(session, "txtGrupoB", value = gb)
    updateTextAreaInput(session, "txtMeanA", value = ma)
    updateTextAreaInput(session, "txtMeanB", value = mb)
    updateTextAreaInput(session, "txtDifPromAB", value = dm)
})

meanDiff <- reactiveValues()
control <- reactiveValues(PermStep=0)

observeEvent(input$btnPermutar2, {

    control$PermStep <- 0
    meanDiff$results <- NULL
    
    monte <- round(runif(input$numPermu, min=1, max=totalPermu()), 0)
    selected <- todas()[,monte]
    
    vDiff <- rep(0, input$numPermu)
    for (i in 1:input$numPermu) {
        newga <- selected[,i]
        newgb <- vecTodos()[vecTodos() %nin% selected[,i]]
        
        newgaC <- paste(as.character(newga), collapse=",")
        newgbC <- paste(as.character(newgb), collapse=",")
        
        
        if(i == 1){
            ga <- paste0(newgaC, "\n" )
            gb <- paste0(newgbC, "\n" )
            ma <- paste0(round(mean(newga),2), "\n" )
            mb <- paste0(round(mean(newgb),2), "\n" )
            dm <- paste0(round(abs(mean(newga)-mean(newgb)),2), "\n" )
        }else{
            ga <- paste0(ga, newgaC, "\n" )
            gb <- paste0(gb, newgbC, "\n" )
            ma <- paste0(ma, round(mean(newga),2), "\n" )
            mb <- paste0(mb, round(mean(newgb),2), "\n" )
            dm <- paste0(dm, round(abs(mean(newga)-mean(newgb)),2), "\n" )
        }
        
        vDiff[i] <- mean(newga)-mean(newgb)
        
    }
    meanDiff$results <- vDiff
    
    updateTextAreaInput(session, "txtGrupoA", value = ga)
    updateTextAreaInput(session, "txtGrupoB", value = gb)
    updateTextAreaInput(session, "txtMeanA", value = ma)
    updateTextAreaInput(session, "txtMeanB", value = mb)
    updateTextAreaInput(session, "txtDifPromAB", value = dm)
    
})

output$Observado <- renderValueBox({
    valor <- abs(mean(vecTratamiento()) - mean(vecControl()))
    
    valueBox(round(valor, 4) , 
             "Valor |Observado|", 
             icon = icon("window-close"), 
             color = "teal"
    )
})

output$MayoresCount <- renderValueBox({
    obs <- abs(mean(vecTratamiento()) - mean(vecControl()))
    difs <- as.numeric(unlist(strsplit(input$txtDifPromAB, split="\n")))
    mayores <- length(difs[difs >= obs])

    valueBox(value = tags$p(mayores, style = "font-size: 100%;"),
             subtitle = "Valores > |Observado|", 
             icon = icon("slack"), 
             color = "purple")
})

output$MayoresPerc <- renderValueBox({
    obs <- abs(mean(vecTratamiento()) - mean(vecControl()))
    difs <- as.numeric(unlist(strsplit(input$txtDifPromAB, split="\n")))
    mayores <- length(difs[difs >= obs])
    
    percent <- 0
    if(mayores > 0){
        percent <- round(mayores/length(difs)*100, 2)
    }
    
    valueBox(paste0(percent, "%") , 
             "% Valores > al |Observado|", 
             icon = icon("percent"), 
             color = "yellow")
    
})


output$plotDensity <- renderPlot({
    
    input$btnPermutar
    input$btnPermutarTodos
    input$btnPermutar2
    
    if(is.null(meanDiff$results)) return(NULL)

    plot(density(meanDiff$results), xlab="Diferencia de Promedios",
         main="Densidad de todas las diferencias")
    abline(v=c(1, -1)*abs(mean(vecTratamiento()) - mean(vecControl())), col="red", lwd=2, lty=1:2)
})

output$plotHistogram <- renderPlotly({
    input$btnPermutar
    input$btnPermutarTodos
    input$btnPermutar2
    
    
    if( is.null( meanDiff$results ) ) return(NULL)
    if( length( meanDiff$results ) < 2 ) return(NULL)
    
    data <- meanDiff$results
    fit <- density(data)
    
    xbins <- compute_bins(data, input$xbins)
    #print(paste0("binds:", xbins))
    
    maxhist <- max(table(cut(data,seq(min(data),max(data),dist(range(data))/input$xbins)))) 
    
    #print(paste0("maxhist: ", maxhist))
    #print(paste0("diff.Absoluta: ", diff.Absoluta()))
    
    plot_ly(x = data) %>% 
        add_histogram( autobinx = FALSE, xbins = xbins, name = "Histograma") %>% 
        add_lines(x = fit$x, y = fit$y, fill = "tozeroy", yaxis = "y2", name = "Densidad") %>% 
        layout(yaxis2 = list(overlaying = "y", side = "right"))  %>%
        add_trace(x = c(diff.Absoluta(), diff.Absoluta()), y= c(0.1, maxhist), mode = "lines", name = "|Valor Observado|", type = "scatter", line = list(color = "#D00000", dash = "dash")) %>% ## 
        add_trace(x = (-1)*c(diff.Absoluta(), diff.Absoluta()), y= c(0.1, maxhist), mode = "lines", name = "-|Valor Observado|", type = "scatter", line = list(color = "#D00000"))
})


# output$TablaPermutaciones <- DT::renderDataTable({
#     
#     print("render table")
#     
#     data <- dfpermutaciones()
#     
#     DT::datatable(data, 
#                   options = list(paging = FALSE, searching = FALSE, scrollX = FALSE), 
#                   selection = "none")
# })




# output$diferenciaBox <- renderValueBox({
#     valueBox(
#         as.character(varTratamientoMean() - varControlMean()), 
#         "Diferencia de promedios",
#         color = "purple"
#     )
# })
# 
# output$diferenciaBox2 <- renderValueBox({
#     valueBox(
#         as.character(varTratamientoMean() - varControlMean()), 
#         "Diferencia de promedios",
#         color = "purple"
#     )
# })
# 
# output$diferenciaBox3 <- renderValueBox({
#     valueBox(
#         as.character(varTratamientoMean() - varControlMean()), 
#         "Diferencia de promedios",
#         color = "purple"
#     )
# })