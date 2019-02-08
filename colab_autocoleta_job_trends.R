#Script Name: colab_autocoleta_job_trends
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Agendar coleta de trends do Twitter

#Este script é chamada a partir do agendamento de jobs colab_autocoleta_cronR

#Chamar os pacotes necessários
#install.packages("devtools")
#install.packages("rtweet")
#install.packages("stringr")
rm(list=ls())
library(devtools)
library(rtweet)
library(stringr)

#Indicar título de cada coleta
title = print("Trending Topics")

#Indicar data e horário de cada coleta
Sys.Date()
Sys.time()

#Coletar as 50 trendings topics do Twitter Brasil naquele horário
trends_br <- get_trends("23424768")

#Dispor as trends no log (o limite para cada campo é de 10.000 caracteres)
strtrim(trends_br,10000)

#Os resultados da coleta serão salvos na pasta em que está o próprio script
#O arquivo em que os resultados serão salvos é o colab_autocoleta_job_trends.log
#Para remover uma tarefa agendada é necessário editar o crontab
#Use o comando "export VISUAL=nano; crontab -e" no terminal
#Apague a linha referente ao job e salve o editor nano com CTRL+X
