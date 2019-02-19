#Script Name: colab_import_data
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido por Viktor Chagas
#Description: Importar e manipular dados de um arquivo CSV

#Importar banco de dados CSV para data.frame
meu_dataframe <- read.csv("~/Dropbox/Pasta/meus_dados.csv", row.names=NULL, sep = ";")

#Criar novo dataframe com contagem de casos a partir do banco original
#O parâmetro maxsum serve para ampliar a contagem, se não estiver presente o R cria uma entrada "Outros" 
DADOS <- as.data.frame(summary(as.factor(meu_dataframe$VARIAVEL), maxsum = 10000))

#Criar novo dataframe a partir de apenas duas variáveis do banco original                                            
DADOS2 <- as.data.frame(table(meu_dataframe$VARIAVEL1, meu_dataframe$VARIAVEL2))

#Transformar a tabela anterior de formato long (vertical) para wide (horizontal), e montar tabela cruzada                     
DADOS3 <- reshape(DADOS2, timevar = "VARIAVEL1", idvar = "VARIAVEL2", direction = "wide")))

#Pesquisar por uma ou mais expressões nas células
#O resultado vai indicar quais células contêm a expressão (TRUE) e quais não contêm (FALSE)
DADOS4 <- as.data.frame(grepl("expressão1|expressão2|pode ter espaço|expressão 3", meu_dataframe$mensagens
     
#Exportar em CSV novamente
write.csv(DADOS, file = "~/Dropbox/Pasta/meus_dados_novos.csv")
