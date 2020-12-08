install.packages('tm')
install.packages('twitteR')
install.packages('wordcloud')
install.packages('RColorBrewer')
library(tm)
library(twitteR)
library(wordcloud)
library(RColorBrewer)

#CONNECT TO TWITTER
ckey <- '7hGkrdPeVKV2xEuMIC5n7AMof'
skey <- 'BjwXflpFYjOYaegAFRXlQHoFxgtFZXv5fGBeqD8RkF7JE26LIT'
token <- '908112209091338240-Jm2etsUDw3ZT6U6DPhIHJoXzp6pVe3H'
sectoken <- 'zSRzhhlcE7MQvX0UJXsuXsHwqXip64NHDESS3SznYOJgM'
setup_twitter_oauth(ckey, skey, token, sectoken)
#RETURNING TWEETS
soccer.tweets <- searchTwitter('soccer', n=1000, lang = 'en')
#GRABBING TEXT DATA FROM TWEETS
soccer.text <- sapply(soccer.tweets, function(x) x$getText())
#CLEAN TEXT DATA
soccer.text <- iconv(soccer.text, 'UTF-8', 'ASCII')
soccer.corpus <- Corpus(VectorSource(soccer.text))
#DOCUMENT TERM MATRIX
term.doc.matrix <- TermDocumentMatrix(soccer.corpus, control=list(removePunctuation=TRUE, stopwords=c('soccer', 'http', stopwords('english')), removeNumbers=TRUE, tolower=TRUE))
#CONVERT OBJECT INTO A MATRIX
term.doc.matrix <- as.matrix(term.doc.matrix)
#GET WORD COUNTS
word.freq <- sort(rowSums(term.doc.matrix), decreasing=TRUE)
dm <- data.frame(word=names(word.freq), freq=word.freq)
#CREATE THE WORDCLOUD
wordcloud(dm$word, dm$freq, random.order = FALSE, colors= brewer.pal(8, 'Dark2'))

