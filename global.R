#library(checkpoint)
#checkpoint("2017-03-31") # YYYY-MM-DD
#packageVersion("markdown")

## Clear workspace (important for debugging in interactive session)
rm(list=ls())

## Load packages
if (!require("pacman")) install.packages("pacman") # Administrador de Paquetes
pacman::p_load("shiny","shinydashboard", 
               "RColorBrewer", "markdown", "combinat",
               "shinyjs", #lets you perform common useful JavaScript operations in Shiny apps that will greatly improve your apps without having to know any JavaScript.
               "HistData", ## Description The 'HistData' package provides a collection of small data sets that are interesting and important in the history of statistics 
               "mcsm", ## Monte Carlo Simulation
               "ggplot2", ## grammar of graphics
               "plotly"
               
)



## Source
#source('heatmap2.R') # overwrite heatmap.2 from gplots with my customized version

## Global variables - used across pages and apps
datGlobal <- NULL
updGlobal <- 0                          # initialize counter to 0

permNum <- 0

'%nin%' <- Negate('%in%')