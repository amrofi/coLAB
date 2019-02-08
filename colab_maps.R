#Script Name: colab_maps
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido a partir de tutorial de Eduardo de Andrade Rodrigues e outros
#Description: Produzir e plotar mapas

#Solicitar pacotes necessários
#install.packages("maps") #mapas simples, eixos, escala, cidades 
#install.packages("mapdata") #base de dados WorldHires e rios
#install.packages("rworldmap") #outra base de dados de mapas do mundo
#install.packages("maptools") #Ler ESRI shapefiles 
#install.packages("mapproj") #Projeções e grids
#install.packages("ggmap") #Gmaps, OSM + mapas baseados em ggplot2
#install.packages("rgdal")
library(maps) #mapas simples, eixos, escala, cidades 
library(mapdata) #base de dados WorldHires e rios
library(rworldmap) #outra base de dados de mapas do mundo
library(maptools) #Ler ESRI shapefiles 
library(mapproj) #Projeções e grids
library(ggmap) #Gmaps, OSM + mapas baseados em ggplot2
library(rgdal)

#Identificar onde estão os diretórios de mapas
#Os arquivos shapefiles disponíveis neste repositório incluem:
##A. mapa de mesoregiões do Brasil (regiões) #br_unidades_da_federacao
##B. mapa de unidades federativas do Brasil (estados) #br_unidades_da_federacao
##C. mapa de municípios do Brasil (municipíos) #br_municipios
##D. mapa de municípios do Rio de Janeiro #rj_municipios
##Mais mapas podem ser encontrados em:
# https://mapas.ibge.gov.br/bases-e-referenciais/bases-cartograficas/malhas-digitais.html
dir("Downloads/Brasil/")
# [1] "BRASIL.dbf" "BRASIL.shp" "BRASIL.shx"

#Carregar o mapa de unidades federativas
br <- readOGR("Downloads/br_unidades_da_federacao/", "BRUFE250GC_SIR")
# OGR data source with driver: ESRI Shapefile
# Source: "mapa_BR", layer: "BRASIL"
# with 27 features and 3 fields
# Feature type: wkbPolygon with 2 dimensions
summary(br)

#Carregar o mapa de municípios do Brasil
br_cidades <- readOGR("Downloads/br_municipios/", "BRMUE250GC_SIR")
# OGR data source with driver: ESRI Shapefile
# Source: "mapa_BR", layer: "BRASIL"
# with 27 features and 3 fields
# Feature type: wkbPolygon with 2 dimensions
summary(br)

#Carregar o mapa de municípios do Rio de Janeiro
rj_cidades <- readOGR("Downloads/rj_municipios/", "33MUE250GC_SIR")
# OGR data source with driver: ESRI Shapefile
# Source: "mapa_BR", layer: "BRASIL"
# with 27 features and 3 fields
# Feature type: wkbPolygon with 2 dimensions
summary(rj)

#Colorir o mapa do Brasil de acordo com as Regiões
palette(c("#ccddff", "#ffddcc", "#ccffcc", "#ffffcc", "#ccffff"))
plot(br_cidades, col = br_cidades$NM_REGIAO)
title("Mapa político do Brasil")

#A partir do mapa de unidades federativas, selecionar um estado específico para plotar
names(br)
head(br$NM_ESTADO)
RJ <- br[br@data$NM_ESTADO=="RIO DE JANEIRO",] ##seleciona e cria um novo shapefile
plot(RJ)

#Comandos adicionais para customizar o mapa de um estado a partir do mapa de unidades federativas
plot(RJ)
map.axes()
map.scale(ratio=F)
plot(RJ[RJ$NM_ESTADO=="RIO DE JANEIRO",], add=T, col="grey70") #seleciona mas não cria um novo shapefile, apenas na hora de plotar
plot(br, add=T, border=alpha("grey50",0.3))

#A partir do mapa de municípios do Rio de Janeiro, selecionar uma cidade específica para plotar
rj@data[["NM_MUNICIP"]] #Ver todos os municípios
Niteroi <- rj[rj@data$NM_MUNICIP=="NITERÓI",]
plot(Niteroi, add=T, col="grey70")

#Plotar um mapa colorizado a partir de uma variável categórica
##Carregar dados numéricos a partir de uma planilha
idh <- read.table("IDH_Brasil.csv", sep = "\t", header = TRUE)
idh <- idh[, c("UF", "ano05")]
names(idh) <- c("UF", "idh05")
##Juntar dados numéricos aos dados geoespaciais
idh$UF <- as.character(idh$UF)
br$UF <- as.character(br$UF)
br <- merge(br, idh)
##Criar variável categórica a partir de dados numéricos
br$idhc05 <- cut(br$idh05, 4)
levels(br$idhc05)
# [1] "(0.677,0.726]" "(0.726,0.776]" "(0.776,0.825]" "(0.825,0.874]"
##Colorir o mapa
palette(c("#779999", "#99bbbb", "#bbdddd", "#ddffff"))
plot(br, col = br$idhc05)
title("IDH dos Estados Brasileiros em 2005")
legend(-74, -18, bty = "n", fill = 4:1,
       legend = levels(br$idhc05)[4:1])

=====

#Plotar mapas usando o pacote maps
library(maps)
par(mar=c(1,1,1,1))
map("world","Canada") #O primeiro parâmetro define o aspecto geral (se país, estado ou cidade) e o segundo o especifica
##Outro exemplo
map('county', 'iowa', fill = TRUE)
##Plotar mapa do Brasil
map("world","Brazil")
###Colorir de cinza
map("world","Brazil", fill=T, col="grey90")
###Atribuir mapa a um data.frame
m <- map("world","Brazil", fill=T, col="grey95") 
###Eixos de latitude e longitude
map.axes() 
###Escala // utilizar ratio = T ou ratio = F
map.scale(ratio = F, cex = 0.7)
###Linha do Equador
abline(h = 0, lty = 2)
###Apresentar cidades com mais de 2 milhões de habitantes
map.cities(country = "Brazil",minpop = 2000000,pch=19, cex=1.2) 
###Com o mapa em data.frame, e library(mapproj), indicar linhas de grid
library(mapproj)
map.grid(m, nx = 5, ny = 5, col="grey50", font=1, cex=0.7 , pretty = T) 

#Outras funções interessantes
countryExData #Dados demográficos sobre países
countryRegions #Dados sobre regiões e abreviaturas de países
county.fips #Conhecer todos os valores de county
state.fips #Conhecer todos os valores de state
world.cities #conhecer todos os valores de cities no mundo

#Mais detalhes em https://rstudio-pubs-static.s3.amazonaws.com/176768_ec7fb4801e3a4772886d61e65885fbdd.html