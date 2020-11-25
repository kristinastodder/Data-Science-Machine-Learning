#GET THE DATA
library(ISLR)
head(iris)
#STANDARDIZE DATA
stand.features <- scale(iris[1:4])
var(stand.features[,1])
final.data <- cbind(stand.features, iris[5])
head(final.data)
#TRAIN AND TEST SPLITS
set.seed(101)
library(caTools)
sample <- sample.split(final.data$Species, SplitRatio = .70)
train <- subset(final.data, sample==TRUE)
test <- subset(final.data, sample==FALSE)
#BUILD A KNN MODEL
library(class)
predicted <- knn(train[1:4], test[1:4], train$Species, k=1)
predicted
misclass.error <- mean(test$Species!=predicted)
print(misclass.error)
#CHOOSING A K VALUE
predicted.species <- NULL
error.rate <- NULL
for(i in 1:10){
  set.seed(101)
  predicted.species <- knn(train[1:4], test[1:4], train$Species, k=i)
  error.rate[i] <- mean(test$Species!=predicted.species)
}
print(error.rate)
library(ggplot2)
k.values <- 1:10
error <- data.frame(error.rate, k.values)
ggplot(error, aes(k.values, error.rate)) + geom_point() + geom_line(lty='dotted', color='red') + theme_bw()
