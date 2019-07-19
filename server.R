shinyServer <- function(input, output) {
  
  observeEvent(input$filtro_avances,{
    
    data_filter_avances <-data %>% 
      select(Fecha.Expedicion,agrupacion=input$filtro_avances,Disponible.Avances,Limite.Cupo) %>% 
      mutate(año = format(Fecha.Expedicion, "%Y"), mes = format(Fecha.Expedicion, "%m") )
    
    variacion_avance<- function(fec_ini, filtro){
      fec_fin<-seq.Date( fec_ini, length=2, by='-1 months' )[2]
      resultado<- data_filter_avances %>% 
        group_by(año,mes,agrupacion) %>%
        summarise(avances=sum(Disponible.Avances)) %>% 
        filter(agrupacion==filtro, año==format(fec_fin, "%Y"), mes==format(fec_fin, "%m")) %>% 
        ungroup() %>% 
        select(avances)
      return(resultado)
    }
    buscar_avance<-Vectorize(variacion_avance)
    data_avance<-data_filter_avances %>% 
      select(año, mes, agrupacion,Disponible.Avances) %>%
      group_by(año,mes,agrupacion) %>% 
      summarise(avances=sum(Disponible.Avances)) %>% 
      mutate(comparar=as.Date(gsub(" ","",paste("01/",mes,"/",año)),"%d/%m/%Y")) %>% 
      mutate(pro=as.integer(buscar_avance(as.Date(comparar,"%d/%m/%Y"),agrupacion))) %>% 
      select(-comparar) %>% 
      mutate(variacion=round(((avances-pro)/pro)*100,2))
    
    output$tabla_avance<-renderDataTable(data_avance)
    
    output$grafica_avance<-renderPlotly({
      data_filter_avances %>% 
      group_by(Fecha.Expedicion) %>%
      summarise(avances=sum(Disponible.Avances)) %>% 
      plot_ly(x = ~Fecha.Expedicion, y = ~avances, mode = 'lines', text = paste("Meses"))
    })
    
  })
  
   observeEvent(input$filtro_limite,{
     data_filter_limite <-data %>%
       select(Fecha.Expedicion,agrupacion=input$filtro_limite,Disponible.Avances,Limite.Cupo) %>%
       mutate(año = format(Fecha.Expedicion, "%Y"), mes = format(Fecha.Expedicion, "%m") )
     variacion_limite<- function(fec_ini, filtro){
       fec_fin<-seq.Date( fec_ini, length=2, by='-1 months' )[2]
       resultado<- data_filter_limite %>%
         group_by(año,mes,agrupacion) %>%
         summarise(avances=sum(Limite.Cupo)) %>%
         filter(agrupacion==filtro, año==format(fec_fin, "%Y"), mes==format(fec_fin, "%m")) %>%
         ungroup() %>%
         select(avances)
       return(resultado)
     }
     buscar_limite<-Vectorize(variacion_limite)
     data_limite<-data_filter_limite %>%
       select(año, mes, agrupacion,Limite.Cupo) %>%
       group_by(año,mes,agrupacion) %>%
       summarise(limite=sum(Limite.Cupo))%>%
       mutate(comparar=as.Date(gsub(" ","",paste("01/",mes,"/",año)),"%d/%m/%Y")) %>%
       mutate(pro=as.integer(buscar_limite(as.Date(comparar,"%d/%m/%Y"),agrupacion))) %>%
       select(-comparar) %>%
       mutate(variacion=round(((limite-pro)/pro)*100,2))
     output$tabla_limite<-renderDataTable(data_limite)
     output$grafica_limite<-renderPlotly({
       data_filter_limite %>% 
         group_by(Fecha.Expedicion) %>%
         summarise(limite=sum(Limite.Cupo)) %>% 
         plot_ly(x = ~Fecha.Expedicion, y = ~limite, mode = 'lines', text = paste("Meses"))
     })
  })
   
     observeEvent(input$filtro_cancelacion,{
       data_cancelacion_filter <-data_cancelacion %>%
         select(agrupacion=input$filtro_cancelacion,fecha,ANO_MES) %>%
         mutate(año = format(fecha, "%Y"), mes = format(fecha, "%m") )
       variacion_cancelacion<- function(fec_ini, filtro){
         fec_fin<-seq.Date( fec_ini, length=2, by='-1 months' )[2]
         resultado<- data_cancelacion_filter %>%
           group_by(año,mes,agrupacion) %>%
           summarise(cantidad=n()) %>%
           filter(agrupacion==filtro, año==format(fec_fin, "%Y"), mes==format(fec_fin, "%m")) %>%
           ungroup() %>%
           select(cantidad)
         return(resultado)
       }
       buscar_cancelacion<-Vectorize(variacion_cancelacion)
       data_cancelacion<-data_cancelacion_filter %>%
         select(año, mes, agrupacion,fecha,ANO_MES) %>%
         group_by(año,mes,agrupacion) %>%
         summarise(cantidad=n())%>%
         mutate(comparar=as.Date(gsub(" ","",paste("01/",mes,"/",año)),"%d/%m/%Y")) %>%
         mutate(pro=as.integer(buscar_cancelacion(as.Date(comparar,"%d/%m/%Y"),agrupacion))) %>%
         select(-comparar) %>%
         mutate(variacion=round(((cantidad-pro)/pro)*100,2))
       output$tabla_cancelacion<-renderDataTable(data_cancelacion)
       output$grafica_cancelacion<-renderPlotly({
         data_cancelacion_filter %>% 
           group_by(fecha) %>%
           summarise(cantidad=n()) %>% 
           plot_ly(x = ~fecha, y = ~cantidad, mode = 'lines', text = paste("Meses"))
       })
     })
}