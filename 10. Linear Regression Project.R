library(ggplot2)
library(dplyr)
#Read CSV
df <- read.csv('bikeshare.csv')
head(df)
print(df)
#Scatterplottarget = count vs. temp
pl <- ggplot(df,aes(x=temp, y=count)) + geom_point(alpha=0.5)
print(pl)
#count vs. datetime as POSIXct
df$datetime <- as.POSIXct(df$datetime)
pl2 <- ggplot(df,aes(x=datetime, y=count, color=temp)) + geom_point(alpha=0.5) + scale_color_continuous(low='#55D8CE',high='#FF6E2E') + theme_bw()
print(pl2)
#correlation between temp and count
cor(df[,c('temp','count')])
#boxplot
pl3 <- ggplot(df, aes(x=factor(season), y= count, color=factor(season))) + geom_boxplot() + theme_bw()
print(pl3)
#add hour column
time.stamp <- df$datetime
df$hour <- format(time.stamp, "%H")
head(df)
#scatterplot count vs. hour
pl4 <- ggplot(df, aes(hour, count, color=temp)) + geom_point(alpha=0.5, position=position_jitter(w=1, h=0)) + scale_color_gradientn(colors=c('blue','green','yellow','red'))
print(pl4)
#scaterplot count vs. hour for non-working days
pl5 <- ggplot(filter(df, workingday==0), aes(hour, count, color=temp)) + geom_point(alpha=0.5, position=position_jitter(w=1, h=0)) + scale_color_gradientn(colors=c('blue','green','yellow','red')) + theme_bw()
print(pl5)
#Build model 
temp.model <- lm(count ~ temp, df)
summary(temp.model)
# Model: count = 9.17(temp) + 6.0462
# count = 9.17(25) + 6.0462 = 235.3 bikes
temp.test <- data.frame(temp=c(25))
predict(temp.model,temp.test)
#change hour column to numeric
df$hour <- sapply(df$hour, as.numeric)
head(df)
#new model
model <- lm(count~. -datetime -atemp -casual -registered -count, df)
summary(model)
