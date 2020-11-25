library(ggplot2)
library(ggthemes)
head(mpg)

pl = ggplot(mpg, aes(x=hwy))
print(pl + geom_histogram(bins = 20, color = 'pink', fill = 'pink'))

pl2 = ggplot(mpg, aes(x=manufacturer))
print(pl2 + geom_bar(aes(fill = factor(cyl))))

head(txhousing)
pl3 = ggplot(txhousing, aes(x=sales, y=volume))
print(pl3 + geom_point(alpha = .5, size = 3, color = 'blue') + geom_smooth(color = 'red', size = 2))

??geom_smooth
