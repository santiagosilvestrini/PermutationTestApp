
## For snapshots of CRAN Repositories:
#library(checkpoint)
#checkpoint("2017-03-31") # YYYY-MM-DD  Sys.Date() - 1
#packageVersion("markdown")

#require(devtools)
#install_version("rsconnect", version = "0.6", repos = "http://cran.us.r-project.org")

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


## Global variables - used across pages and apps
permNum <- 0

## Global functions and operators
'%nin%' <- Negate('%in%') ## define NOT IN custom operator
