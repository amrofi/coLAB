#Script Name: colab_get_trends_simple
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado da documentação do pacote rtweet.info
#Description: Coletar trends

#Solicitar pacotes de instalação necessários
library(devtools)
library(rtweet)
library(twitteR)

#Coletar trending topics no Brasil
trends_br <- get_trends("23424768")
