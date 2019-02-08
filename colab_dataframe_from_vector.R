#Script Name: colab_dataframe_from_vector
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Criar data.frame a partir de um conjunto de vetores

#Criar vetores
sexo <- c("Masculino", "Feminino", "Feminino", "Masculino", "Feminino")
idade <- c(40, 37, 17, 13, 10)
estado.civil <- c("casado", "casado", "solteiro", "solteiro",
                  "solteiro")

#Criar data.frame e incorporar vetores
bd <- data.frame(sexo, idade, estado.civil)
