#Script Name: colab_ca
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido com a supervisão de Emerson Cervi
#Description: Plotar gráfico de análise de correspondência canônica

#Solicitar pacotes necessários
#install.packages(ca)
library(ca)

#Criar tabela cruzada
##Método 1# Criar a tabela cruzada importando dados da área de transferência (clipboard) diretamente do Excel
bd <- read.table("clipboard")
##Método 2# Criar a tabela cruzada importando dados da área de transferência (clipboard) diretamente do Word
bd <- read.table(pipe("pbpaste"), header=T)
##Método 3# Criar tabela cruzada a partir de outro data.frame
table(bd$var1, bd$var2)
#Ou verificar o script colab_cross_table.R

#Executar análise de correspondência canônica
ca(bd)

#Plotar gráfico de análise de correspondência canônica
plot(ca(bd))
     
#Customizar gráfico
#O parâmetro main indica o título do gráfico
#Os parâmetros ylab e xlab indicam os nomes dos eixos
#O parâmetro col indica as cores em vetores RGB
#O parâmetro col.lab indica as cores dos labels em vetores RGB
plot(ca(bd4), main="Décadas x Tipos", ylab="Dimensão 2 (6,3%)", xlab="Dimensão 1 (89,3%)", col = c("#433f62","#FF914B"), col.lab = c("#433f62","#FF914B"))
