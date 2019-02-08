#Script Name: colab_plot_top_retweets
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido a partir de tutorial de Eduardo de Andrade Rodrigues
#Description: Produzir gráficos de autores com mais retweets

#Solicitar pacotes necessários
require(ggplot2)

#Identificar a quantidade de autores e autores únicos
length(bd$screen_name) 
length(unique(bd$screen_name))

#Criar o data.frame retweetsByAuthor a partir do banco de tweets coletado
retweetsByAuthor <- aggregate(formula = bd$quoted_retweet_count ~ bd$screen_name, data = bd, FUN = sum)

#Ordenar o data.frame retweetsByAuthor de acordo com a coluna de frequência de retweets
retweetsByAuthor <- arrange(retweetsByAuthor, desc(`bd$quoted_retweet_count`)) ## sorting

#Criar um novo data.frame somente com o TOP10 (dez autores com maior quantidade de retweets)
top10 <- head(retweetsByAuthor, 10)

#Plotar um gráfico com os valores de retweets
#Atenção: caso haja valores idênticos de retweets, o comando pode somar e produzir anomalias no gráfico
ggplot (head(retweetsByAuthor, 10), aes(reorder(`bd$quoted_retweet_count`, -`bd$quoted_retweet_count`), `bd$quoted_retweet_count`)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

#Mais informações em https://rpubs.com/eduRodrigues/RetrievingTweets