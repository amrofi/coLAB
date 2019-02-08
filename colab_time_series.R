#Script Name: colab_time_series
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado do livro "R para Cientistas Sociais", de Jakson Alves de Aquino
#Description: Criar série temporal

#Plotar série temporal0
ts.plot(ts.lat, ts.fur, lty = 1:2, ylab = "Nº de ocorrências",
        xlab = "Ano")
legend("topright", legend = c("Latrocínios", "Furtos/1000"),
       lty = 1:2, bty = "n")

