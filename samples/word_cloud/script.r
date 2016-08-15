#install.packages("NLP")
#install.packages("wordcloud")
#install.packages("RColorBrewer")
#install.packages("tm")

library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

cv_data <- read.delim("diego.txt", header = FALSE)

#View(cv_data)
ab <- cv_data

cd <- Corpus(VectorSource(ab))
cd <- tm_map(cd, PlainTextDocument)
cd <- tm_map(cd, removePunctuation)
cd <- tm_map(cd, content_transformer(tolower))
cd <- tm_map(cd, removeWords, c("this", "the", "her", "his","used", 
                                "months", "years", "year", "and",
                                "february",
                                "new", "june",
                                stopwords("english")))
cd <- tm_map(cd, removeNumbers)
cd <- tm_map(cd, stripWhitespace)

wordcloud(cd, ramdom.order = F, max.words = 70)
