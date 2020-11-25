library(dplyr)

head(mtcars)
head(filter(mtcars, mpg>20, cyl==6))

head(arrange(mtcars, cyl, desc(wt)))

head(select(mtcars, mpg, hp))

distinct(select(mtcars, gear))     

head(mutate(mtcars, Performance = hp/wt))

summarise(mtcars, avg_mpg=mean(mpg))

result = mtcars %>% filter(cyl==6) %>% summarise(avg_hp=mean(hp))
print(result)
