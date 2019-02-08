#Script Name: colab_get_tweets
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado da documentação do pacote rtweet.info
#Description: Coletar dados do Twitter

#FUNÇÃO 1# Buscar Twets por palavra-chave (Search API)

#Instalar pacotes necessários
#install.packages(c("devtools", "rjson", "bit64", "httr", "openssl", "httpuv", "rtweet", "twitter", "ggplot2"))
#install.packages("mongolite")
#install.packages("rtweet")
#devtools::install_github("mkearney/rtweet")
#install_github("twitteR", username="geoffjentry")

#Solicitar pacotes necessários
library(devtools)
library(twitteR)
library(rtweet)

##Rodar script de autenticação do Twitter colab_token_twitter.R

#Buscar por N tweets a partir da hashtag ou palavra-chave "#MUSEUdeMEMES"
bd_museu <- search_tweets(
  "#MUSEUdeMEMES", n = 1000000, include_rts = FALSE, retryonratelimit = TRUE, verbose = TRUE
)

##Rodar script de exportação de data.frames para outros formatos de arquivo colab_export_data.R


#FUNÇÃO 2# Buscar Tweets por palavra-chave em um período de tempo específico (Search API)

#Solicitar pacotes necessários
library(dplyr)
library(twitteR)
library(knitr)

#Buscar por N tweets publicados de acordo com a data especificada
#Alterar parâmetros since (desde) e until (até) e a string de busca (searchString)
bd <- searchTwitter(searchString = "memes", n=100, lang="pt",
                        since="2019-02-07", until="2019-02-08" , resultType = "popular")

#Finalizada a busca, converter o resultado em um data.frame
bd_tweets <- twListToDF(bd)


#FUNÇÃO 3# Coleta de trending topics

#Solicitar pacotes necessários
library(devtools)
library(rtweet)

#Coletar trending topics do Brasil no momento
trends_br <- get_trends("23424768")


#FUNÇÃO 4# Streaming de tweets (Streaming API)

#Solicitar pacotes necessários
library(devtools)
library(rtweet)

#Streaming de tweets em busca de hashtag ou palavra-chave específica por N segundos
#Os termos separados por vírgula indicam o operador OU
#O timeout é calculado em segundos
bd <- stream_tweets("memes, museu", timeout = 60)


#FUNÇÃO 5# Exportar em CSV

# Write CSV in R
bd2 <- apply(bd,2,as.character)
write.table(bd2, "~/Desktop/arquivo.csv", sep=",")
#Mais métodos de exportação no script colab_export_data.R

#AJUDA# Ajuda e outros parâmetros importantes
vignette("stream", package = "rtweet")