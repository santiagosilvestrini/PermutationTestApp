source("header.R")
source("sidebar.R")
source("body.R")
source("helpers/helpers.R")

ui <- dashboardPage(
    skin = "purple",
    header, sidebar, body
    
)
