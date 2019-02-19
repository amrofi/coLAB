#Script Name: colab_plot_data
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Criar e manipular gráficos

#1. BARPLOT
#Criar gráfico de barras (barplot)
#Este script pode ser combinado com colab_import_data, responsável pela importação e manipulação dos dados

#Mudar nomes de variáveis, se necessário
#O número indicado entre colchetos é o número do vetor ocupado pela variável que se pretende alterar
colnames(DADOS)[1]
colnames(DADOS)[1]<-"QNTDE"

#Ajustar margens do gráfico
#A ordem de componentes do vetor para as margens é: bottom, left, top, right
DADOS_plot <- par(mar=c(8,4,3,1))

#Plotar gráfico de barras
#O parâmetro names.arg define os nomes das colunas, las define o direcionamento do texto,
#  ylim calcula o tamanho máximo do eixo y, e
#  cex.names define o tamanho das fontes das legendas e valores do gráfico
DADOS_plot <- barplot(DADOS$QNTDE, names.arg = row.names(DADOS), las="2", ylim=c(0, 500), cex.names = 0.7)

#Inserir legenda
text(x = DADOS_plot, y = DADOS$QNTDE, label = DADOS$QNTDE, 
     pos = 3, cex = 0.7, col = "black")


#2. TIMESERIES
#Criar gráfico de serie temporal
#Crie uma tabela CSV com valores de uma variável de acordo com um intervalo de tempo contínuo
# Atenção: não pode haver interrupção na frequência (uma lacuna de um dia, ou um mês)
meus_dados_ts <- read.csv("~/Dropbox/Pasta/meus_dados_ts.csv", sep=",")

#Caso necessário, converta os valores em datas
meus_dados_ts$VARIAVEL <- as.Date(meus_dados_ts$VARIAVEL, "%d/%m/%y")

#Plotar série temporal
ts.plot(meus_dados_ts$VARIAVEL, ylab = "Freq",
        xlab = "2018", lty = 1, gpars=list(xaxt="n"))

#Defina os valores dos eixos
#axis(1, at = venezuela_ts$X, cex.axis = .7)
#axis(1, at = seq(6, 11, by = 1), labels = F, las=3)
#axis(1, at = seq(as.Date("2018/6/1"), as.Date("2018/12/1"), by="mon"))

#Defina a legenda do gráfico
legend("topright", legend = c("Latrocínios", "Furtos/1000"),
       lty = 1:2, bty = "3")


#3. BOXPLOT
#Criar gráfico de caixa e bigode (boxplot)
boxplot(DADOS$QNTDE, data=DADOS, xlab="", ylab="Legenda")