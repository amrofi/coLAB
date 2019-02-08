#Script Name: colab_coding_factors
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Transformar variáveis do tipo numéricas (numeric) em variáveis categóricas (factor)

#Criar labels para variáveis numéricas e aplicá-los transformando-as em variáveis categóricas
bd$sexo <- factor(bd$sexo, levels = c(1, 2),
                  labels = c("Masculino", "Feminino"))
