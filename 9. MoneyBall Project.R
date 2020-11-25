batting = read.csv('Batting.csv')
head(batting)
str(batting)
head(batting$AB)
head(batting$X2B)

batting$BA = batting$H / batting$AB
tail(batting$BA, 5)

batting$OBP = (batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)
tail(batting$OBP, 5)

batting$X1B= batting$H - batting$X2B - batting$X3B - batting$HR
print(batting$X1B)
batting$SLG = ((batting$X1B) + (2*batting$X2B) + (3*batting$X3B) + (4*batting$HR)) / (batting$AB)
tail(batting$SLG, 5)

str(batting)

sal = read.csv('Salaries.csv')
head(sal)

summary(batting)
batting = subset(batting, yearID>1984)
summary(batting)

combo = merge(batting, sal, c('playerID', 'yearID'))
summary(combo)

lost_players = subset(combo, playerID %in% c('giambja01', 'damonjo01', 'saenzol01'))
print(lost_players)

lost_players2 = subset(lost_players, yearID==2001)
print(lost_players2)

lost_players3 = lost_players2[,c('playerID', 'H', 'X2B', 'X3B', 'HR', 'OBP', 'SLG', 'BA', 'AB')]
head(lost_players3)

sum(lost_players3$OBP) #1.091606
sum(lost_players$AB) #18274

combo2 = subset(combo, yearID==2001)
print(combo2)

newplayers = subset(combo2, OBP>0.3)
newplayers2 = subset(newplayers, AB>500)
newplayers3 = subset(newplayers2, salary<5000000)
print(newplayers3)
str(newplayers3)

library(ggplot2)
finalplayers = ggplot(newplayers3, aes(x=OBP, y=salary)) + geom_point(size = 2)


library(plotly)
ggplotly(finalplayers)

library(dplyr)
pick3 = arrange(newplayers3, desc(OBP), salary)
pick3[, c('playerID', 'OBP', 'salary')]


#New Players: pujola101, eckstda01, rolliji01
