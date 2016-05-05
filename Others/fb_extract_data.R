library(SnowballC)
library(sqldf)
#8NP.db <- dbConnect(SQLite(), dbname="OfficialBritishNationalParty.db")
#sqldf("SELECT * from Nodes", dbname = "Test1.sqlite")
mydata <- read.csv("test_fb.csv", sep = ";") #read csv file

library(tm)
corpus1 <- Corpus(VectorSource(mydata$message)) #create Corpus object
corpus1 <- tm_map(corpus1, tolower, mc.preschedule = FALSE) #convert text to lower case
corpus1 <- tm_map(corpus1, mc.cores=1, removePunctuation)
corpus1 <- tm_map(corpus1, removeNumbers, mc.cores=1)
corpus1 <- tm_map(corpus1, removeWords, stopwords("english"), mc.preschedule = FALSE)

tdm <- TermDocumentMatrix(corpus1)
            