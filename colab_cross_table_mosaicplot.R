#Script Name: colab_cross_table_mosaicplot
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Criar tabela quádrupla e plotar gráfico mosaico

#Instalar pacotes necessários (retirar linha de comentário abaixo)
#install.packages("descr")

#Solicitar pacote descr
require(descr)

#Criar data.frame a partir de três variáveis cruzadas
ct <- crosstab(pesb$rlg, pesb$sexo, pesb$peso)

#visualizar data.frame e plotar gráfico mosaico
ct
# Conteúdo das células
# |-------------------------|
# | Contagem |
# |-------------------------|
#
# ==========================================
# pesb$sexo
# pesb$rlg Feminino Masculino Total
# ------------------------------------------
# Evangélica 231 152 383
# ------------------------------------------
# Católica 872 811 1683
# ------------------------------------------
# Nenhuma 54 88 142
# ------------------------------------------
# Total 1157 1051 2208
# ==========================================