library(shiny)
library(shinydashboard)
library(dplyr)
library(data.table)
library("readxl")
library(lubridate)
library(data.table)
library(tidyverse)
library(DT)
library(plotly)

consumo_producto<-fread("data/consumo_producto.txt", sep = ";", header = T)
consumo_producto$consumo<-as.integer(consumo_producto$consumo)
train<-fread("data/train.csv", header = T)
train_demografica<-read_xlsx("data/train_test_demograficas.xlsx")
train$Disponible.Avances<-as.integer(gsub(" ","",train$Disponible.Avances))
train$Limite.Cupo<-as.integer(gsub(" ","",train$Limite.Cupo))
train$Fecha.Expedicion<-as.Date(train$Fecha.Expedicion,"%d/%m/%Y")
data <- train_demografica %>%
  inner_join(train, by = c("id","id")) %>% 
  select (Fecha.Expedicion,categoria,segmento,nivel_educativo,edad,estrato, Disponible.Avances, Limite.Cupo) 

data_cancelacion<-train_demografica %>%
  inner_join(train, by = c("id","id")) %>% 
  select(categoria,segmento,nivel_educativo,edad,estrato,Disponible.Avances,ANO_MES) %>% 
  filter(!is.na(ANO_MES)) %>% 
  mutate(fecha=as.Date(paste("01",substring(ANO_MES,5,6),substring(ANO_MES,1,4), sep = "/"), "%d/%m/%Y"))


