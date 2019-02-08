#Script Name: colab_reshape_dataframe
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Remodelar banco de dados, passando valores duplicados em linhas para colunas em tabelas quádruplas

#Inserir vetores de dados (país, ano e população)
pais <- c(rep("Brasil", 3), rep("Bulgária", 3), rep("Índia", 3))
ano <- rep(c(1960, 1980, 2000), 3)
populacao <- c(71695, 122958, 175553, 7867, 8844, 7818, 445857,
               687029, 1002708)

#Converter vetores em data.frame
b3 <- data.frame(pais, ano, populacao)

#Visualizar data.frame
#Os dados estarão alinhas com valores duplicados em linhas
b3
# pais ano populacao
# 1 Brasil 1960 71695
# 2 Brasil 1980 122958
# 3 Brasil 2000 175553
# 4 Bulgária 1960 7867
# 5 Bulgária 1980 8844
# 6 Bulgária 2000 7818
# 7 Índia 1960 445857
# 8 Índia 1980 687029
# 9 Índia 2000 1002708

#Passar os valores duplicados em linhas para colunas
#Os dados serão convertidos em colunas e o banco será remodelado
reshape(b3, timevar = "ano", idvar = "pais", direction = "wide")
# pais populacao.1960 populacao.1980 populacao.2000
# 1 Brasil 71695 122958 175553
# 4 Bulgária 7867 8844 7818
# 7 Índia 445857 687029 100270

#Alternativamente...
pais <- c("Brasil", "Bulgária", "Índia")
pop.1960 <- c(71695, 7867, 445857)
pop.1980 <- c(122958, 8844, 687029)
pop.2000 <- c(175553, 7818, 1002708)
b5 <- data.frame(pais, pop.1960, pop.1980, pop.2000)
b6 <- reshape(b5, idvar = "pais", timevar = "ano", direction = "long",
              varying = c("pop.1960", "pop.1980", "pop.2000"))
rownames(b6) <- 1:9