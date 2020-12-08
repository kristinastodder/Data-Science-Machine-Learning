##NEURAL NET PROJET
#GET THE DATA
banknote <- read.csv('bank_note_data.csv')
head(banknote)
str(banknote)
#EDA
library(ggplot2)
plot <- ggplot(banknote, aes(x=Entropy)) + geom_histogram() + theme_bw()
plot
#TRAIN TEST SPLIT
library(caTools)
split <- sample.split(banknote$Class, SplitRatio=0.7)
train <- subset(banknote, split=TRUE)
test <- subset(banknote, split=FALSE)
str(train)
#BUILDING THE NEURAL NET
library(neuralnet)
help(neuralnet)
nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, data=train, hidden=10, linear.output=FALSE)
plot(nn)
#PREDICTIONS
predicted.nn.values <- compute(nn, test[,1:4])
head(predicted.nn.values$net.result)
predictions <- sapply(predicted.nn.values$net.result, round)
head(predictions)
table(predictions, test$Class)
#COMPARING MODELS
library(randomForest)
banknote$Class <- factor(banknote$Class)
library(caTools)
set.seed(101)
split <- sample.split(banknote$Class, SplitRatio=0.7)
train <- subset(banknote, Split=TRUE)
test <- subset(banknote, split==FALSE)
model <- randomForest(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, data=train)
banknote.predict <- predict(model, test)
table(banknote.predict, test$Class)
