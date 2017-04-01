source("header.R")
source("sidebar.R")
source("body.R")

ui <- dashboardPage(
    skin = "purple",
    header, sidebar, body
)
