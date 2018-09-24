##Script fornecido pelo INCT.DD##

#Streaming das menções a candidatos#
user_ids= "33374761,74215006,762402774260875265,128372940,2670726740,354095556,105155795,870030409890910210,256730310,73745956,73889361,989899804200325121"

palavra ="bolsonaro"

stream_tweets(q= user_ids, 
              timeout = (60*2), 
              parse = FALSE, 
              file_name="tweets.json", 
              token=twitter_token)

dados <- parse_stream("tweets.json")