#Script Name: colab_stream_mentions
#Author: coLAB
#Author URL: http://www.colab.uff.br
#License: GNU General Public License v2 or later
#License URL: http://www.gnu.org/licenses/gpl-2.0.html
#Reference: Script desenvolvido pelo INCT.DD
#Description: Fazer coleta via streaming de menções a candidatos

#Definir IDs de usuários cujos dados serão coletados
user_ids= "33374761,74215006,762402774260875265,128372940,2670726740,354095556,105155795,870030409890910210,256730310,73745956,73889361,989899804200325121"
palavra ="bolsonaro"

#Função de streaming, salvar resultado em JSON
stream_tweets(q= user_ids, 
              timeout = (60*2), 
              parse = FALSE, 
              file_name="tweets.json", 
              token=twitter_token)

#Carregar JSON em data.frame
dados <- parse_stream("tweets.json")