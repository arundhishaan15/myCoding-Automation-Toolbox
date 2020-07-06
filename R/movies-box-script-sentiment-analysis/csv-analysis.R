options(java.parameters = "- Xmx1024m")
library(readr)
library(RSentiment)
library(rJava)
library(xlsx)

simpsons_dataset <- read_csv("simpsons.csv")

sentences <- c()

for (i in 1:nrow(simpsons_dataset)) {
  sentences[i] <- simpsons_dataset$spoken_words[i]
}

gc()

scores <- calculate_score(sentences)

gc()

sentiment <- calculate_sentiment(sentences)

gc()

plot.data = data.frame(sentences,scores,sentiment)

am_object <- table(plot.data$sentiment)
print(am_object)


visual.data <- prop.table(am_object)
print(visual.data)


barplot(visual.data, main="Sentiment % Breakdown", xlab="Sentiment Classification", col= "blue")
