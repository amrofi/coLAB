#Script Name: colab_coding_NA
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Atribuir valores NA para variáveis

#Atribuir o valor NA para todos os códigos NS e NR (de não-respondido) da variável x
x [ x == "NS" | x == "NR"] <- NA