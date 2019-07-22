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
                                h1("proceso de desarrollado"),
                                tags$section( style = "height:700px; overflow-y: scroll;",
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
                                              h2("Importación de información", id="importacion"),
                                              br(),
                                              "Para la importación de la información se hizo uso de las librerias readxl y dplyr por medio de las siguientes librerías:", 
                                              br(),
                                              tags$ul(
                                                tags$li(
                                                  "data.table implementando la función fread."
                                                ),
                                                tags$li(
                                                  "readxl implentando la función read_xlsx."
                                                )
                                              ),
                                              br(),br(),
                                              h2("Manipulación de información"),
                                              br(),
                                              "Para el manejo de la información se utilizó la librería dplyr implentando el siguiente procedimiento para obtener el data frame.",
                                              br(),
                                              tags$ul(
                                                tags$li(
                                                  "Se cruzó la base de datos train con la base de datos train_demograficos por medio de la función inner join con variable de union id correspondientes a cada tabla."
                                                ),
                                                tags$li(
                                                  "Se selecciono las columnas necesarias por medio de la función select."
                                                )
                                              ),
                                              br(),
                                              tags$h2("From end"),
                                              "Para el diseño del from se utilizó la librería shinydashboard, el cual proporciona la estructura con las funciones head, sidebar y body.",
                                              br(),
                                              tags$ul(
                                                tags$li(
                                                  "Head",
                                                  br(),
                                                  "Para el head se ingreso el titulo Colsubsidio."
                                                ),
                                                tags$li(
                                                  "sidebar",
                                                  br(),
                                                  "Para el sidebar se agrego una menu desplegable llamado train 4 sub items Descrición, Avances, Limite y Cancelación."
                                                ) ,
                                                tags$li(
                                                  "Body",
                                                  br(),
                                                  "En el body se ingresó el contenido que de la app distribuido en cuatro pestañas.",
                                                  br(),
                                                  tags$ul(
                                                    tags$li(
                                                      "Descripción",
                                                      br(),
                                                      "Muestra el procedimiento utilizado para el desarrollo de la app."
                                                    ),
                                                    tags$li(
                                                      "Avances",
                                                      br(),
                                                      "En esta pestaña se visualizará los datos para el tema de avances.",
                                                      br(),
                                                      "Arranca con un filtro de lista desplegable el cúal contiene como items las agrupación requeridas a las cuales se les va a calcular una variación.",
                                                      br(),
                                                      "se puede observar que está dividida en dos partes en la parte de la izquierda se muestra una tabla con las siguientes columnas:",
                                                      tags$ul(
                                                        tags$li(
                                                          "Año",br(),"Año en el que se realizó el avance."
                                                        ),
                                                        tags$li(
                                                          "Mes",br(),"Mes en el que se realizó el avance."
                                                        ),
                                                        tags$li(
                                                          "Agrupación",br(),"Variable por la que se realizó la agrupación de información."
                                                        ),
                                                        tags$li(
                                                          "Avances",br(),"Valor del avance realizado."
                                                        ),
                                                        tags$li(
                                                          "Pro",br(),"Está variable me muestra el valor por el cúal se requiere calcular la variación."
                                                        ),
                                                        tags$li(
                                                          "Variación",br(),"Variación calculada entre la columna avances y pro."
                                                        )
                                                      )
                                                    ),
                                                    tags$li(
                                                      "Limite",
                                                      br(),
                                                      "En esta pestaña se visualizará los datos para el tema de avances.",
                                                      br(),
                                                      "Arranca con un filtro de lista desplegable el cúal contiene como items las agrupación requeridas a las cuales se les va a calcular una variación.",
                                                      br(),
                                                      "se puede observar que está dividida en dos partes en la parte de la izquierda se muestra una tabla con las siguientes columnas:",
                                                      tags$ul(
                                                        tags$li(
                                                          "Año",br(),"Año en el que se realizó el avance."
                                                        ),
                                                        tags$li(
                                                          "Mes",br(),"Mes en el que se realizó el avance."
                                                        ),
                                                        tags$li(
                                                          "Agrupación",br(),"Variable por la que se realizó la agrupación de información."
                                                        ),
                                                        tags$li(
                                                          "Avances",br(),"Valor del avance realizado."
                                                        ),
                                                        tags$li(
                                                          "Pro",br(),"Está variable me muestra el valor por el cúal se requiere calcular la variación."
                                                        ),
                                                        tags$li(
                                                          "Variación",br(),"Variación calculada entre la columna avances y pro."
                                                        )
                                                      )
                                                    ),
                                                    tags$li(
                                                      "Cancelación",
                                                      br(),
                                                      "En esta pestaña se visualizará los datos para el tema de cancelación.",
                                                      br(),
                                                      "Arranca con un filtro de lista desplegable el cúal contiene como items las agrupación requeridas a las cuales se les va a calcular una variación.",
                                                      br(),
                                                      "se puede observar que está dividida en dos partes en la parte de la izquierda se muestra una tabla con las siguientes columnas:",
                                                      tags$ul(
                                                        tags$li(
                                                          "Año",br(),"Año en el que se realizó el avance."
                                                        ),
                                                        tags$li(
                                                          "Mes",br(),"Mes en el que se realizó el avance."
                                                        ),
                                                        tags$li(
                                                          "Agrupación",br(),"Variable por la que se realizó la agrupación de información."
                                                        ),
                                                        tags$li(
                                                          "Avances",br(),"Valor del avance realizado."
                                                        ),
                                                        tags$li(
                                                          "Pro",br(),"Está variable me muestra el valor por el cúal se requiere calcular la variación."
                                                        ),
                                                        tags$li(
                                                          "Variación",br(),"Variación calculada entre la columna avances y pro."
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              ),
                                              h2("Back end"),
                                              "Para el diseño del from se utilizó la librería shinydashboard, para este ejercicio se puede dividir en dos secciones, la parte para cargar las tablas y las parte para cargar las graficas.",
                                              br(),
                                              tags$ul(
                                                tags$li(
                                                  "Tablas - renderTable",
                                                  br(
                                                    "Por medio de la función observeEvent de la librería de shiny se puedo filtrar la información según la lista creada en el from, lo unicó para resaltar en está sección es la función que se diseño por separa la cuál calcula el valor del mes anterior, esta función se calcula por cada fila que tabla y queda almacenada en el campo pro.",
                                                    br(),
                                                    "El campo variación se uso la formula ((x - x0)/x0)*100.",
                                                    br(),
                                                    "Se guardó el resultado en una variable output para poder imprimirce en el from."
                                                  )
                                                ),
                                                tags$li(
                                                  "Grafica - renderPlotly",
                                                  br(),
                                                  "Por medio de la función observeEvent de la librería de shiny se puedo filtrar la información según la lista creada en el from.",
                                                  br(),
                                                  "Para la grafica se uso la función plot_ly de la librería plotly y se guardó el resultado en una variable output para poder imprimirce en el from."
                                                )
                                              )
                                              
                                              
                                ), tags$p(
                                  "Hecho por Kevin Felipe Vargas"
                                )
                                
                                
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
