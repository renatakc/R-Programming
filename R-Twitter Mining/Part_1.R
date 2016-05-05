consumer_key <- 'XzrKYjsswrEqD4HH0pWOLLxaE'
consumer_secret <- 'N6ZEyi5CZStiASpwHa7RWQfxPGEE22ntKwJKeGQ3ABqxb6OIam'
access_token <- '43606065-ZH0uf5jWIQ6F2dApoELNPSF33ARuSj7kPXmaQY2xi'
access_secret <- 'H4OoxCNWjJ5953jfftvdclMzsd1ZHKJnH4Ndfi20MMky1'
library(twitteR)
library(tm)

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

'search for key words'
data_tweets <- searchTwitter("renata", n = 5, lang = "en")

data_science <- searchTwitter("data+science", lang = "en", n = 500, resultType = "recent")
data_sci_text <- sapply(data_science, function(x) x$getText())
str(data_sci_text)

data_sci_corpus <- Corpus(VectorSource(data_sci_text))

inspect(data_sci_corpus[3])

data_clean <- tm_map(data_sci_corpus, removePunctuation)
data_clean <- tm_map(data_clean, content_transformer(tolower))
data_clean <- tm_map(data_clean, removeWords, stopwords("english"))
data_clean <- tm_map(data_clean, removeNumbers)
data_clean <- tm_map(data_clean, stripWhitespace)
data_clean <- tm_map(data_clean, removeWords, c("data", "science"))
wordcloud(data_clean)
wordcloud(data_clean, random.order = F, max.words = 50, colors = rainbow(20))
wordcloud(data_clean, random.order = F, max.words = 50)

write.table(data_sci_corpus, "c:/Users/Re/Desktop/data_raw.txt")


