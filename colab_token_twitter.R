#Script Name: colab_token_twitter
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Autenticar Twitter

#Solicitar pacotes
library(rtweet)
library(twitteR)

##Método 1 de autenticação pelo browser
create_token(
  app = "hashmeme",
  consumer_key = "MYC0fw01n3afdL2wuDM3Bbqjf",
  consumer_secret = "Tk5SJVaRv8Gr4cPHgxkbOPtzCg5fs2FpNokqeEOMPIaNqNe93w")

#Método 2 de autenticação completa
##Guardar tokens do Twitter
api_key <- "MYC0fw01n3afdL2wuDM3Bbqjf"
api_secret <- "Tk5SJVaRv8Gr4cPHgxkbOPtzCg5fs2FpNokqeEOMPIaNqNe93w"
access_token <- "12328292-cm58BeIGB3kER3Kjx9ddGQpCCJ964R05yEC4CRLul"
access_token_secret <- "a5vuPc3SZZaCCZ8JVtcBHbBUejBJVOWygLyxG76xlt3N6"
##Autenticação completa
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
