#Script Name: colab_zodiac
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido a partir de tutorial
#Description: Identificar signos zodiacais a partir de datas

#Solicitar pacotes necessários
#install.packages("DescTools")
require(DescTools)

#Descobrir o signo de horóscopo ocidental de uma data específica
Zodiac(as.Date("1982-01-07"))

#Descobrir o signo de horóscopo chinês de um dado ano
zodiac(1981)

#Entrar com um conjunto de datas para descobrir um signo
Zodiac(as.Date(c("1937-07-28", "1936-06-01", "1966-02-25",
                 "1964-11-17", "1972-04-25")), lang="engl", stringsAsFactors = TRUE)

#Carregar dados de planilha CSV com datas
bd <- read.csv("data.csv", sep=";", dec=".")
bd
bd$data

#Transformar a variável data em signos do zodíaco
astrochart <- Zodiac(bd$data)

#Plotar um gráfico com a frequência de signos do zodíaco na amostra
Desc(astrochart)

#Mais informações em https://rdrr.io/cran/DescTools/man/Zodiac.html
# https://cran.r-project.org/web/packages/DescTools/DescTools.pdf