#pacotes de instalação necessários
install.packages(c("devtools", "rjson", "bit64", "httr", "openssl", "httpuv", 
                   "rtweet", "twitter", "ggplot2"))
install.packages("rtweet")
devtools::install_github("mkearney/rtweet")
install_github("twitteR", username="geoffjentry")
library(devtools)
library(rtweet)
library(twitteR)

## método 1 de autenticação pelo browser
create_token(
  app = "INSERIR NOME DO APP",
  consumer_key = "INSERIR CONSUMER KEY",
  consumer_secret = "INSERIR CONSUMER SECRET")

#método 2 de autenticação por token
api_key <- "INSERIR API KEY"
api_secret <- "INSERIR API SECRET"
access_token <- "INSERIR ACCESS KEY"
access_token_secret <- "INSERIR ACCESS SECRET"
#autenticação
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# busca por N tweets a partir da hashtag ou palavra-chave "#MUSEUdeMEMES"
bolsonaro <- search_tweets(
  "bolsonaro", n = 100, include_rts = FALSE, retryonratelimit = TRUE, verbose = TRUE
)

#exportar para CSV
Ursal <- apply(Ursal,2,as.character)
write.csv(Ursal, "~/Desktop/ursal.csv")

#busca por N tweets restrita à data especificada
library(rtweet)
q <- "#EstouComBolsonaro"
n <- 9000000000
since <- "2018-08-10"
until <- "2018-08-11"
#EstouComBolsonaro <- search_tweets(
  q = q, n = n, type = "recent", since = since,
  until = until, include_rts = FALSE,
  retryonratelimit = TRUE, verbose = TRUE)

#coleta de trending topics no Brasil
trends_br <- get_trends("23424768")

# streaming de tweets sobre a hashtag ou palavra-chave específica 
# por período definido (60 segundos x 60 minutos * 24 horas *  7 dias)
stream_tweets(
  "#DebateBand,#EstouComBolsonaro,#BoulosNaBand,#CiroNaBand,#DebateComLula",
  timeout = 60 * 60 * 6 * 1,
  file_name = "/Users/viktor/Documents/R/nometemporario.json",
  parse = FALSE
)

# streaming de tweets sobre a hashtag ou palavra-chave específica 
# por período definido (60 segundos x 60 minutos * 24 horas *  7 dias)
stream_tweets(
  "#DebateRedeTV",
  timeout = 60 * 60 * 4 * 1,
  file_name = "/Users/viktor/Documents/R/debateredetv.json",
  parse = FALSE
)

##exportar para JSON
library(readr)
library(jsonlite)
write_json(Ursal,'/Users/viktor/Documents/R/ursal.json')


### Outros parâmetros importantes

## select one or more twitter users to lookup
users <- c(
  "potus", "hillaryclinton", "realdonaldtrump",
  "fivethirtyeight", "cnn", "espn", "twitter"
)

## get users data
celeb_df <- lookup_users(users)

## view users data
celeb_df

## view tweet data for these users via tweets_data()
tweets_data(celeb_df)

# }

searchTwitter('@hillaryclinton', n=500)

## search for 5000 tweets using the rstats hashtag
DebateBand <- search_tweets(
  "#DebateBand", n = 1000000000000, include_rts = FALSE, parse = FALSE, retryonratelimit = TRUE, verbose = TRUE
)

search_tweets('#DebateBand', n = 1000000000000, type = "recent", include_rts = FALSE,
              parse = FALSE, retryonratelimit = TRUE, verbose = TRUE)


cnn <- get_timelines(c("cnn", "BBCWorld", "foxnews"), n = 3200, retryonratelimit =TRUE)
cnn
