#Script Name: colab_autocoleta_cronR
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Agendar jobs no crontab do Unix/Linux

#Este script chama tarefas a ser agendadas como colab_autocoleta_job_trends

#Chamar os pacotes necessários
#install.packages("cronR")
#install.packages("rtweet")
rm(list=ls())
library(cronR)
library(rtweet)

#Adicionar um job ao crontab do Unix/Linux.
#O job adicionado executa um script R externo
#Cada novo job deve receber uma numeração única. Usar job1, job2, job3
job1 <- cron_rscript("colab_autocoleta_trends.R")

#O job adicionado será executado a cada minuto (minutely) ou a cada hora (hourly)
cronR::cron_add(job1, "minutely")
#Listar a tabela de jobs do crontab
cron_ls()
#Para verificar os jobs em execução, digite no terminal: crontab -e
#Para editar e deletar jobs em andamento, digite: export VISUAL=nano; crontab -e