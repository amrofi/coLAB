#Script Name: colab_sample_data
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Sortear amostra a partir de um banco de dados XLS

#Solicitar pacotes necessários
#install.packages(readxl)
require(readxl)

#Importar banco de dados XLS para data.frame
my_data <- read_xlsx("BD.xlsx")

#Sortear N casos
#O número de ocorrências sorteadas é definido pelo parâmetro da função
#O sorteio é feito com base nas linhas do banco de dados, elimina-se as linhas não-sorteadas
my_data2 <- my_data[sample(nrow(my_data), 10), ]
