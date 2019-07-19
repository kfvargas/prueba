
ui <- dashboardPage(skin = "black",
  dashboardHeader(title = "Colsubsidio"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Train", icon = icon("fas fa-chevron-down"), tabName = "parte1", 
               menuSubItem("Descipción", tabName = "descripcion", icon = icon("fas fa-file-alt")),
               menuSubItem("Avances", tabName = "avances", icon = icon("fas fa-address-card")),
               menuSubItem("Limite", tabName = "limite", icon = icon("fas fa-book-open")),
               menuSubItem("Cancelacion", tabName = "cancelacion", icon = icon("far fa-clipboard"))
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName="descripcion",
              h1("proceso desarrollado"),
              h2("Librerías utilizadas"),
              "library(shiny)",
              br(),
              "library(shinydashboard)",
              br(),
              "library(dplyr)",
              br(),
              "library(data.table)",
              br(),
              "library(readxl)",
              br(),
              "library(lubridate)",
              br(),
              "library(data.table)",
              br(),
              "library(tidyverse)",
              br(),
              "library(DT)",
              br(),
              "library(plotly)",
              br(),br(),
              h2("Importación de información"),
              "Para la importación de la información se hizo uso de las librerias readxl y dplyr por medio de las funcion"
      ),
      tabItem(tabName="avances",
              h2("Avances"),
              selectInput("filtro_avances", "Agrupaciones:", c("categoria"="categoria","segmento"="segmento","nivel_educativo"="nivel_educativo","edad"="edad","estrato"="estrato"),selected = "Categoria"),
              fluidRow(
                box(title = "",width = 6,
                    dataTableOutput("tabla_avance", height = 500)
                ),
                box(title = "",width = 6,
                    plotlyOutput("grafica_avance", height = 500)
                )
              )
      ),
      tabItem(tabName="limite",
              h2("Limite"),
              selectInput("filtro_limite", "Agrupaciones:", c("categoria"="categoria","segmento"="segmento","nivel_educativo"="nivel_educativo","edad"="edad","estrato"="estrato"),selected = "Categoria"),
              fluidRow(title="Avances",
                       box(title = "",width = 6,
                           dataTableOutput("tabla_limite", height = 500)
                       ),
                       box(title = "",width = 6,
                           plotlyOutput("grafica_limite", height = 500)
                       )
              )
      ),
      tabItem(tabName="cancelacion",
              h2("Cancelación"),
              selectInput("filtro_cancelacion", "Agrupaciones:", c("categoria"="categoria","segmento"="segmento","nivel_educativo"="nivel_educativo","edad"="edad","estrato"="estrato"),selected = "Categoria"),
              fluidRow(title="Avances",
                       box(title = "",width = 6,
                           dataTableOutput("tabla_cancelacion", height = 500)
                       ),
                       box(title = "",width = 6,
                           plotlyOutput("grafica_cancelacion",height = 500)
                       )
              )
      )
      )
    )
)