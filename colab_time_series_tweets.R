#Script Name: colab_time_series_tweets
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script retirado da documentação do pacote rtweet.info
#Description: Criar série temporal a partir de baco de tweets

#FUNÇÃO 1# Plotar série temporal
ts_plot(bd, by="secs")


#FUNÇÃO 2# Plotar múltiplas séries temporais agrupadas pelo screen name
bd %>%
  dplyr::group_by(screen_name) %>%
  ts_plot() +
  ggplot2::labs(
    title = "Tweets during election day for the 2016 U.S. election",
    subtitle = "Tweets collected, parsed, and plotted using `rtweet`"
  )


#FUNÇÃO 3# Customizar as séries temporais definindo o intervalo da frequência de postagem
tmls %>%
  dplyr::filter(created_at > "2017-10-29") %>%
  dplyr::group_by(screen_name) %>%
  ts_plot("days", trim = 1L) +
  ggplot2::geom_point() +
  ggplot2::theme_minimal() +
  ggplot2::theme(
    legend.title = ggplot2::element_blank(),
    legend.position = "bottom",
    plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequency of Twitter statuses posted by news organization",
    subtitle = "Twitter status (tweet) counts aggregated by day from October/November 2017",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )
