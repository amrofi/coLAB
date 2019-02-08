#Script Name: colab_linear_regression_model
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido a partir de múltiplos tutoriais do Rcmdr
#Description: Produzir gráficos de regressão linear simples e múltipla

#Solicitar pacotes necessários
#install.packages(Rcmdr)
#install.packages(QuantPsyc)
require(Rcmdr)
require(QuantPsyc)

#Calcular estatísticas de regressão linear entre duas variáveis
bd2 <- lm(bd$quoted_followers_count~bd$quoted_friends_count)

#Calcular estatísticas de regressão linear entre múltiplas variáveis
bd3 <- lm(bd$quoted_followers_count~bd$quoted_friends_count+bd$quoted_retweet_count+bd$quoted_statuses_count)
lm.beta(bd3)

#Plotar gráfico de regressão linear simples
plot(bd2)

#Plotar gráfico de regressão linear múltipla com quatro gráficos apresentados simultaneamente
#Os parâmetros do comando mfrow indicam N linhas e N colunas (2, 2)
par(mfrow = c(2, 2))
plot(bd3)
#É preciso retornar ao modo padrão de pareamento de gráficos depois
#par(mfrow = c(1, 1))

#Plotar gráfico de regressão linear simples customizado
plot(bd$quoted_followers_count ~ bd$quoted_friends_count, ylab = "Logaritmo dos votos",
     xlab = "Logaritmo dos gastos")

#Outros exemplos de customização de gráficos podem ser encontrados em
# http://ecologia.ib.usp.br/bie5782/doku.php?id=bie5782:03_apostila:05a-graficos