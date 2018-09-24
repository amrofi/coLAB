## search for 250,000 tweets containing the word data
carmen <- search_tweets(
  "Carmen Lúcia", n = 250000, include_rts = FALSE, retryonratelimit = TRUE
)

## plot time series of tweets
ts_plot(carmen, "2 hours") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequency of 'Carmen Lúcia' Twitter statuses from past 9 days",
    subtitle = "Twitter status (tweet) counts aggregated using two-hour intervals",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )

# Write CSV in R
rosaweber <- apply(rt,2,as.character)
write.table(rosaweber, "~/Desktop/rosaweber2.csv", sep=",")
