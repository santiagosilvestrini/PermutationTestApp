# Resources
source("helpers/custom_functions.R") 
#source("../helpers/helpers.R")

# On Load
#shinyjs::disable("btnPermutar")
#shinyjs::disable("btnPermutarTodos")
#shinyjs::disable("btnPermutar2") 

# [ToDo] Put some order below!

#output$ttestoutput <- renderText({   })
output$TratamientoData <- renderText({ paste0("Promedio: ", as.character(round(mean(vecTratamiento()),4))) })
output$ControlData <- renderText({ paste0("Promedio: ", as.character(round(mean(vecControl()),4))) })
output$DiferenciaPromedios <- renderText({ 
    #print("call DiferenciaPromedios")
    as.character(round(mean(vecTratamiento()) - mean(vecControl())),4) })

output$TotalPermutaciones <- renderText({ 
    #print("call totalpermutaciones")
    #print(paste0("control$PermStep:", control$PermStep))
    #print(paste0("totalPermu:", totalPermu()))
    
        paste0(control$PermStep, "/", totalPermu()) 
})

output$ttestoutput <- renderUI({ 
})
output$ttest <- renderUI({ 
    ga <- vecTratamiento()
    gb <- vecControl()

    ttest <- t.test(ga, gb)
   
    HTML(paste0(
                "<b>data: </b>", ttest$data.name,
                "<br/><b>method: </b>", ttest$method,
                "<br/><b>t.test p-value: </b>", ttest$p.value, 
                "<br/><b>t statistc: </b>", ttest$statistic,
                "<br/><b>df: </b>", ttest$parameter
                #"<br/><b>H0: </b>", ttest$null.value
                #"<br/><b>alternative: </b>", ttest$alternative,
                #"<br/><b>conf.int: </b>", ttest$conf.int
                ))
    #ttest$statistic
    #ttest$conf.int
    #ttest$alternative
})

vecTodos <- eventReactive(c(input$txtTratamiento, input$txtControl, input$btnGenerar), {
    shinyjs::enable("btnPermutar")
    shinyjs::enable("btnPermutarTodos")
    shinyjs::enable("btnPermutar2") 
    meanDiff$results <- NULL
    df$Permutaciones <- df$Permutaciones[0,]
    
    #print( paste0("vecTodos:", vecTratamiento(), "-", vecControl()))
    
    c(vecTratamiento(), vecControl())
})


diff.Absoluta <- reactive({ abs(mean(vecTratamiento()) - mean(vecControl())) })

numGrupoA <- reactive({ 
    #print( paste0( "numGrupoA L:", length(as.numeric(unlist(strsplit(input$txtTratamiento, split="\n"))))) )
    length(as.numeric(unlist(strsplit(input$txtTratamiento, split="\n"))))
})    

numGrupoB <- reactive({ 
    length(as.numeric(unlist(strsplit(input$txtControl, split="\n")))) 
})

vecTratamiento <- eventReactive(input$txtTratamiento, {
    #print(paste0("vecTratamiento:",input$txtTratamiento ))
    as.numeric(unlist(strsplit(input$txtTratamiento, split="\n")))
})

vecControl <- eventReactive(input$txtControl, {
    #print(paste0("vecControl:",input$txtControl ))
    as.numeric(unlist(strsplit(input$txtControl, split="\n")))
})


totalPermu <- eventReactive(c(input$txtTratamiento, input$txtControl), {
    #print("total permu1")
    #print(paste0("vecTodos:", length(vecTodos())))
    #print(paste0("numGrupoA:", numGrupoA()))
    #print(dim(combn(vecTodos(),numGrupoA()))[2] )
    
    
    n1 <- length(vecTratamiento())
    n2 <- length(vecControl())
    n <- n1 + n2
    
    permu <- factorial(n) / ( factorial(n1) * factorial(n2) ) #=FACT(H3)/(FACT(E3)*FACT(E4))
    
    #print(paste0("n1:", n1))
    #print(paste0("n2:", n2))
    #print(paste0("n:", n))
    #print(paste0("n:", factorial(n)))
    #print(paste0("permus:", permu))
    
    #dim(combn(vecTodos(),numGrupoA()))[2] 
    permu
})


todas <- eventReactive(c(input$txtTratamiento, input$txtControl, input$btnGenerar), {
    combn(vecTodos(),numGrupoA())
})

#length(permn(3))
#dim(combn(3,2))[2]
#varTratamientoMean <- c(19, 22, 25, 26)
#varControlMean <- c(23, 33, 40)
#todos <- c(varTratamientoMean, varControlMean)



#output$perm_button <- renderUI({
#    actionButton("btnPermutar", label = paste0("Permutar (", as.character(input$btnPermutar[1]) ,"/", as.character(totalPermu()), ")" ),
#                 width = "50%", icon("exchange"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
#})
observeEvent(input$seedchoice, {
    #print("choice changed!")
})

output$CheatSheet <- renderUI({
    withMathJax(HTML(markdown::markdownToHTML(knit('intro/cheatsheet.Rmd', quiet = TRUE))))
})

observeEvent(input$btnGenerar, {
    
    myseed <- 0
    #print(input$seedchoice )
    
    if (input$seedchoice == "random"){
        myseed <- sample(1:100000, 1) #.Random.seed
        updateNumericInput(session, "seed", value = myseed)
    }else{
        myseed <- input$seed
    }
    
    print(paste0("myseed:", myseed))
    
    set.seed(myseed)
    
    aValues <- NULL
    bValues <- NULL
    control$PermStep <- 0
    
    #updateTextAreaInput(session, "txtGrupoA", value = "")
    #updateTextAreaInput(session, "txtGrupoB", value = "")
    #updateTextAreaInput(session, "txtMeanA", value = "")
    #updateTextAreaInput(session, "txtMeanB", value = "")
    #updateTextAreaInput(session, "txtDifPromAB", value = "")
    
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
               aValues <- round(rbinom(size = input$binomial.a.n, n = input$binomial.a.sample, prob = input$binomial.a.p), 2)
           },
           "6"={
               aValues <- round(runif(min = input$uniforme.a.min, max = input$uniforme.a.max, n = input$uniforme.a.sample), 2)
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
               bValues <- round(rbinom(size = input$binomial.b.n, n = input$binomial.b.sample, prob = input$binomial.b.p), 2)
           },
           "6"={
               bValues <- round(runif(min = input$uniforme.b.min, max = input$uniforme.b.max, n = input$uniforme.b.sample), 2)
           },
           {
               print(paste0("Bdefault:", input$selectDistributionB))
           }
    )
    
    updateTextAreaInput(session, "txtTratamiento", value = paste(as.character(aValues), collapse="\n"))
    updateTextAreaInput(session, "txtControl", value = paste(as.character(bValues), collapse="\n"))
    shinyjs::enable("btnPermutar")
    shinyjs::enable("btnPermutar2")
    shinyjs::enable("btnPermutarTodos")
})

observeEvent(input$btnPermutar, {
    btnClick <- input$btnPermutar[1]
    
    control$PermStep <- control$PermStep + 1
    
    #print("btnPermutar_Click")
    #print(paste0("totalPermu:", totalPermu()))
    #print(paste0("control$PermStep:", control$PermStep))
    #print(paste0("todas():", todas()))
    
    if(control$PermStep == totalPermu()) shinyjs::disable("btnPermutar")
    
    if (control$PermStep <= totalPermu()){
        newga <- todas()[,control$PermStep]
        #print(paste0("vecTodos:", vecTodos()))
        newgb <- vecTodos()[vecTodos() %nin% newga]
        #print(paste0("newgb:", newgb))
        
        newgaC <- paste(as.character(newga), collapse=",")
        newgbC <- paste(as.character(newgb), collapse=",")
        
        if(control$PermStep > 1){
            #ga <- input$txtGrupoA
            #gb <- input$txtGrupoB
            #ma <- input$txtMeanA
            #mb <- input$txtMeanB
            #dm <- input$txtDifPromAB
            
        }else{
            meanDiff$results <- NULL
            df$Permutaciones <- df$Permutaciones[0,]
            
            #ga <- NULL
            #gb <- NULL
            #ma <- NULL
            #mb <- NULL
            #dm <- NULL
        }
        #updateTextAreaInput(session, "txtGrupoA", value = paste0(ga, newgaC, "\n" ))
        #updateTextAreaInput(session, "txtGrupoB", value = paste0(gb, newgbC, "\n" ))
        #updateTextAreaInput(session, "txtMeanA", value = paste0(ma, round(mean(newga),2), "\n" ))
        #updateTextAreaInput(session, "txtMeanB", value = paste0(mb, round(mean(newgb),2), "\n" ))
        #updateTextAreaInput(session, "txtDifPromAB", value = paste0(dm, round(abs(mean(newga)-mean(newgb)),2), "\n" ))
        
        df$Permutaciones[control$PermStep, ] <- c(newgaC, newgaC, round(mean(newga),2), round(mean(newgb),2), round(abs(mean(newga)-mean(newgb)),2))
        
        vDiff <- mean(newga)-mean(newgb)
        meanDiff$results[control$PermStep] <- vDiff
        
        
    }

        
})

checkExists <- function(mv, lista){
    existe <- FALSE
    for(i in 1:length(lista)){
        if(identical(mv, unlist(lista[[i]][1]))){
            existe <- TRUE
            break
        }
    }
    existe
}

observeEvent(input$btnPermutarTodos, {
    withBusyIndicatorServer("btnPermutarTodos", {

        control$PermStep <- 0
        meanDiff$results <- NULL
        
        df$Permutaciones <- df$Permutaciones[0,]
        
        selected <- combn(vecTodos(),numGrupoA()) #todas()
        
        vDiff <- rep(0, length(totalPermu()))
    
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
            
            df$Permutaciones[i, ] <- c(newgaC, newgaC, round(mean(newga),2), round(mean(newgb),2), round(abs(mean(newga)-mean(newgb)),2))
            
        }
        meanDiff$results <- vDiff
        
        #updateTextAreaInput(session, "txtGrupoA", value = ga)
        #updateTextAreaInput(session, "txtGrupoB", value = gb)
        #updateTextAreaInput(session, "txtMeanA", value = ma)
        #updateTextAreaInput(session, "txtMeanB", value = mb)
        #updateTextAreaInput(session, "txtDifPromAB", value = dm)
    })
})

meanDiff <- reactiveValues()
control <- reactiveValues(PermStep=0)

observeEvent(input$btnPermutar2, {
    withBusyIndicatorServer("btnPermutar2", {
        control$PermStep <- 0
        meanDiff$results <- NULL
        df$Permutaciones <- df$Permutaciones[0,]
        
        if (input$seedchoice == "random"){
            myseed <- sample(1:100000, 1) #.Random.seed
            updateNumericInput(session, "seed", value = myseed)
        }else{
            myseed <- input$seed
        }
        
        set.seed(myseed)
        
        #monte <- round(runif(input$numPermu, min=1, max=totalPermu()), 0)
        
        #selected <- todas()[,monte]
        selected <- list()
        rep <- input$numPermu
        group <- length(vecTratamiento())
            
        for(i in 1:rep){
            g1 <- sort(sample(vecTodos(), group))
 
            if (i > 1 & rep<=totalPermu()){
                while (checkExists(g1, selected)){
                    g1 <- sort(sample(vecTodos(), group))
                }
            }
            
            g2 <- sort(vecTodos()[vecTodos() %nin% g1])
            #print(g1)
            #print(g2)
            selected[[i]] <- list(g1, g2)
        }    
        
        #print(selected)   
        
        vDiff <- rep(0, input$numPermu)
        
        for (i in 1:input$numPermu) {
            
            newga <- unlist(selected[[i]][1])
            newgb <- unlist(selected[[i]][2])
            
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
            
            df$Permutaciones[i, ] <- c(newgaC, newgaC, round(mean(newga),2), round(mean(newgb),2), round(abs(mean(newga)-mean(newgb)),2))
        }
        meanDiff$results <- vDiff
    })
    
})


observeEvent(input$btnPermutar3, {
    withBusyIndicatorServer("btnPermutar2", {
        control$PermStep <- 0
        meanDiff$results <- NULL
        df$Permutaciones <- df$Permutaciones[0,]
        
        
        
        if (input$seedchoice == "random"){
            myseed <- sample(1:100000, 1) #.Random.seed
            updateNumericInput(session, "seed", value = myseed)
        }else{
            myseed <- input$seed
        }
        
        set.seed(myseed)
        
        monte <- round(runif(input$numPermu, min=1, max=totalPermu()), 0)
        
        selected <- todas()[,monte]
        
        vDiff <- rep(0, input$numPermu)
        
        for (i in 1:input$numPermu) {
            
            todos <- vecTodos()
            
            
            
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
            
            df$Permutaciones[i, ] <- c(newgaC, newgaC, round(mean(newga),2), round(mean(newgb),2), round(abs(mean(newga)-mean(newgb)),2))
        }
        meanDiff$results <- vDiff
        
        #updateTextAreaInput(session, "txtGrupoA", value = ga)
        #updateTextAreaInput(session, "txtGrupoB", value = gb)
        #updateTextAreaInput(session, "txtMeanA", value = ma)
        #updateTextAreaInput(session, "txtMeanB", value = mb)
        #updateTextAreaInput(session, "txtDifPromAB", value = dm)
    })
    
})

df <- reactiveValues(
    Permutaciones = data.frame(GrupoA = character(0), GrupoB = character(0), 
               MeanA = numeric(0), MeanB = numeric(0),
               AbsDif = numeric(0), stringsAsFactors = FALSE)
)

output$TablaPermutaciones <- DT::renderDataTable({
    
    print("render table")
    
    data <- df$Permutaciones
    
    DT::datatable(data, 
                  options = list(paging = TRUE, searching = FALSE, scrollX = TRUE), 
                  selection = "none")
}, server = FALSE, plugins = 'natural', 
    options = list(
                    columnDefs = list(list(type = "natural", targets = "_all")),
                    pageLength = 20,
                    lengthMenu = c(20, 50, 100, 200))

#, options = list(
   # columnDefs = list(list(targets = c(2:4), type = "num-fmt")))

)

output$Observado <- renderValueBox({
    valor <- abs(mean(vecTratamiento()) - mean(vecControl()))
    
    valueBox(round(valor, 4) , 
             "|Valor Observado|", 
             icon = icon("bullseye"), 
             color = "teal"
    )
})

output$MayoresCount <- renderValueBox({
    obs <- abs(mean(vecTratamiento()) - mean(vecControl()))
    #difs <- as.numeric(unlist(strsplit(input$txtDifPromAB, split="\n")))
    difs <- as.numeric(df$Permutaciones[,5])
    
    mayores <- length(difs[difs >= obs])

    valueBox(value = tags$p(mayores, style = "font-size: 100%;"),
             subtitle = "Mayores al |Observado|", 
             icon = icon("slack"), 
             color = "purple")
})

output$MayoresPerc <- renderValueBox({
    obs <- abs(mean(vecTratamiento()) - mean(vecControl()))
    #difs <- as.numeric(unlist(strsplit(input$txtDifPromAB, split="\n")))
    difs <- as.numeric(df$Permutaciones[,5])
    mayores <- length(difs[difs >= obs])
    
    percent <- 0
    if(mayores > 0){
        percent <- round(mayores/length(difs)*100, 2)
    }
    
    if ((percent/100) < input$nivelSignificacion){
        boxColor <- "red"
    }else{
        boxColor <- "yellow"
    }
    
    valueBox(paste0(percent, "%") , 
             "Mayores al |Observado|", 
             icon = icon("percent"), 
             color = boxColor)
    
})

output$tpvalue <- renderValueBox({
    ga <- vecTratamiento()
    gb <- vecControl()
    
    ttest <- t.test(ga, gb)
    
    #HTML(paste0("<b>t.test p-value: </b>", ttest$p.value, "<br/><b>t statistc: </b>", ttest$statistic))
    
    if (ttest$p.value < input$nivelSignificacion){
        boxColor <- "red"
    }else{
        boxColor <- "yellow"
    }
    
    valueBox(round(ttest$p.value, 3) , 
             "t-test p-value", 
             icon = icon("slack"), 
             color = boxColor)
    
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

output$plotBoxplot <- renderPlotly({
    #input$btnGenerar
    
    grupoA <- as.numeric(unlist(strsplit(input$txtTratamiento, split="\n")))
    grupoB <- as.numeric(unlist(strsplit(input$txtControl, split="\n")))

    data <- data.frame(values = c(grupoA, grupoB),
                     vars = rep(c("Grupo A","Grupo B"), times = c(length(grupoA),length(grupoB))))
    
    plot_ly(data, x = ~vars, y = ~values, type = "box", color = ~vars, 
            boxpoints = "all", jitter = 0.3, pointpos = -1.8)
    
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
    #updateSliderInput(session, "xbins", value = xbins)
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

