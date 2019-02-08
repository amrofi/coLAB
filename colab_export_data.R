#Script Name: colab_export_data
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Exportar data.frames

#Salvar um único objeto em formato RDS
saveRDS(DebateAparecida, "~/Dropbox/DADOS-memes-2018/debateaparecida.rds")

#Carregar um arquivo RDS como data.frame
my_data <- readRDS("mtcars.rds")

#Salvar o ambiente de trabalho e data.frames em formato RData
save(DebateBand, file = "~/Dropbox/DADOS-memes-2018/debateband.RData")

#Salvar múltiplos objetos
save(data1, data2, file = "data.RData")

#Carregar o arquivo RData
load("data.RData")

#Exportar para CSV (método 1)
Ursal <- apply(Ursal,2,as.character)
write.csv(Ursal, "~/Desktop/ursal.csv")

#Exportar para CSV (método 2)
write.csv(c, file="~/Desktop/ursal.csv", fileEncoding = "UTF-8")

#Exportar para JSON (método 1)
#install.packages("reader")
#install.packages("jsonlite")
library(readr)
library(jsonlite)
write_json(DebateNaGlobo,'/Users/viktor/Dropbox/DADOS-memes-2018/debatenaglobo.json')

#Exportar para JSON (método 2)
#install.packages("rjson")
library("rjson")
json_file <- "/Volumes/HD VIKTOR/DADOS Memes 2018/debateredetv.json"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))