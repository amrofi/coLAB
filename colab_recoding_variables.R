#Script Name: colab_recoding_variables
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Criar variável categórica (factor) a partir de outra variável categórica (factor)

#Recodificar a variável A (partido) a partir de níveis de categorias definidos para a variável B (posição do partido)
sen$pos <- recode(sen$partido,
                  "Situação" <- c("PT", "PMDB", "PSB", "PV", "PTB", "PC do B", "PP",
                                  "PRTB", "PL", "PMN", "PT do B", "PAN", "PSC", "PTC",
                                  "PHS", "PTN", "PRB", "PRONA"),
                  "Intermediário" <- c("PCB", "PDT", "PRP", "PSDC", "PSL"),
                  "Oposição" <- c("PSDB", "PFL", "PPS", "PSOL", "PSTU", "PCO"))

#Apresentar sumário para a variável B recém-criada
summary(sen$pos)