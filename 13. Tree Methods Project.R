library(ISLR)
head(College)
data(College)
df <- College
library(ggplot2)
scatterplot <- ggplot(df, aes(Room.Board, Grad.Rate)) + geom_point(aes(color=Private)) + theme_bw() 
print(scatterplot)
histogram <- ggplot(df, aes(F.Undergrad)) + geom_histogram(aes(color=Private)) + theme_bw()
print(histogram)
histogram2 <- ggplot(df, aes(Grad.Rate)) + geom_histogram(aes(color=Private)) + theme_bw()
print(histogram2)
subset(df, Grad.Rate>100)
df['Cazenovia College', 'Grad.Rate'] <- 100
#TRAIN TEST SPLIT
library(caTools)
set.seed(101)
sample <- sample.split(df, SplitRatio=0.7)
train <- subset(df, sample==TRUE)
test <- subset(df, sample==FALSE)
library(rpart)
tree <- rpart(Private~., method='class', data=train)
tree.preds <- predict(tree, test)
head(tree.preds)
tree.preds <- as.data.frame(tree.preds)
joiner <- function(x){
  if (x>=0.5){
    return('Yes')
}else{
  return('No')
  }
}
tree.preds$Private <- sapply(tree.preds$Yes, joiner)
print(tree.preds)
table(tree.preds$Private, test$Private)
library(rpart.plot)
plot(tree, main='Decision Tree - Private School')
text(tree)
prp(tree)
#RANDOM FOREST
library(randomForest)
rf.model <- randomForest(Private ~., data=train, importance=TRUE)
rf.model$confusion
rf.model$importance
#PREDICTIONS
p <- predict(rf.model, test)
table(p, test$Private)
