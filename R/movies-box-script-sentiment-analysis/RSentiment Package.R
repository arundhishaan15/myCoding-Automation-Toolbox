library(RSentiment)


calculate_total_presence_sentiment(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
calculate_sentiment(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
#scores = calculate_score(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
b


sentences =(c("This is ok","This is ok","This is ok","This is very amazing and wonderful","This is wonderful and amazing","This is horrible and the worst and awful","This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
print(sentences)
scores = calculate_score(sentences)
print(scores)
category=calculate_total_presence_sentiment(sentences)
print(category)

sentiment = calculate_sentiment(sentences)
print(sentiment)




#category = calculate_sentiment(c("This is a good text", "This is a bad text", "This is a really bad text", "This is horrible"))
#print(scores)
#print(category)

plot.data = data.frame(sentences,scores,sentiment)
print(plot.data)

print(plot.data$scores)
am_object = table(plot.data$sentiment)
print(am_object)


visual.data = (prop.table(am_object))
print(visual.data)


barplot(visual.data, main="Sentiment % Breakdown", xlab="Sentiment Classification", col= "blue")
