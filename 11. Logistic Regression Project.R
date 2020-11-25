#LOGISTIC REGRESSION PROJECT

#GET THE DATA
adult <- read.csv('adult_sal.csv')
head(adult)
library(dplyr)
adult <- select(adult, -X)
head(adult)
str(adult)
summary(adult)

#DATA CLEANING
table(adult$type_employer)
unemp <- function(job){
  job <- as.character(job)
  if (job=='Never-worked' | job=='Without-pay'){
  return('Unemployed')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer, unemp)
table(adult$type_employer)

SLgov <- function(job){
  job <- as.character(job)
  if (job=='State-gov' | job=='Local-gov'){
  return('State-Local gov')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer, SLgov)
table(adult$type_employer)

selfemp <- function(job){
  job <- as.character(job)
  if (job=='Self-emp-inc' | job=='Self-emp-not-inc'){
    return('Self Employed')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer, selfemp)
table(adult$type_employer)

table(adult$marital)
Married <- function(status){
  status <- as.character(status)
  if (status=='Married-AF-spouse' | status=='Married-civ-spouse' | status=='Married-spouse-absent'){
    return('Married')
  }else{
    return(status)
  }
}
adult$marital <- sapply(adult$marital, Married)
table(adult$marital)

Notmarried <- function(status){
  status <- as.character(status)
  if(status=='Divorced' | status=='Widowed' | status=='Separated'){
    return('Not married')
  }else{
    return(status)
  }
}
adult$marital <- sapply(adult$marital, Notmarried)
table(adult$marital)

Nevermarried <- function(status){
  status <- as.character(status)
    if (status=='Never-married'){
      return('Never-Married')
    }else{
      return(status)
  }
}
adult$marital <- sapply(adult$marital, Nevermarried)
table(adult$marital)  

table(adult$country)
nsamerica <- c('Canada', 'Columbia', 'Cuba', 'Dominican-Republic', 'Ecuador', 'El-Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Outlying-US(Guam-USVI-etc)', 'Peru', 'Puerto-Rico', 'United-States')
europe <- c('England', 'France', 'Germany', 'Greece', 'Holand-Netherlands', 'Hungary', 'Iran', 'Ireland', 'Italy', 'Poland', 'Scotland', 'Yugoslavia', 'Portugal')
asia <- c('China', 'Hong', 'India', 'Japan', 'Laos', 'Philippines', 'South', 'Taiwan', 'Thailand', 'Vietnam', 'Cambodia')
continent <- function(cntry){
  cntry <- as.character(cntry)
  if (cntry %in% nsamerica){
    return('Americas')
  }
  else if (cntry %in% europe){
    return('Europe')
  }
  else if (cntry %in% asia){
    return('Asia')
  }
  else if (cntry %in% asia){
    return('Asia')
  }else {
    return('Other')
  }
}
adult$country <- sapply(adult$country, continent)
table(adult$country)
str(adult)
adult$country <- sapply(adult$country, factor)
adult$type_employer <- sapply(adult$type_employer, factor)
adult$marital <- sapply(adult$marital, factor)
str(adult)

#MISSING DATA
library(Amelia)
adult[adult == '?'] <- NA
table(adult$type_employer)
missmap(adult, y.at=c(1), y.labels = c(''), col=c('yellow', 'black'))
table(adult$type_employer)
adult <- na.omit(adult)

#EDA
str(adult)
missmap(adult, y.at=c(1), y.labels = c(''), col=c('yellow', 'black'))
library(ggplot2)
ggplot(adult, aes(age)) + geom_histogram(aes(fill=income), color='black', binwidth=1) + theme_bw()
ggplot(adult, aes(hr_per_week)) + geom_histogram(color='black') + theme_bw()
names(adult)[names(adult)=='country'] <- 'region'
head(adult)
ggplot(adult, aes(region)) + geom_bar(aes(fill=income), color='black') + theme_bw()

#BUILDING A MODEL
head(adult)
library(caTools)
sample <- sample.split(adult$income, SplitRatio = 0.7)
train <- subset(adult, sample==TRUE)
test <- subset(adult, sample==FALSE)
help(glm)
model = glm(income ~ ., family = binomial(logit), data=train)
summary(model)
help(step)
new.model <- step(model)
summary(new.model)
test$predicted.income = predict(model, newdata=test, type='response')
table(test$income, test$predicted.income > 0.5)
#Accuracy
(6443+1364)/(6443+477+931+1364)
#Recall
6443/(6443+477)
#Precision
6443/(6443+931)
