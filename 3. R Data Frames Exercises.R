Name = c('Sam', 'Frank', 'Amy')
Age = c(22, 25, 150)
Weight = c(150, 165, 120)
Sex= c('M', 'M', 'F')
dat = data.frame(row.names = Name, Age, Weight, Sex)
dat
is.data.frame(mtcars)
mat = matrix(1:25, nrow=5)
as.data.frame(mat)
df = mtcars
df
head(df)
mean(df$mpg)
subset(df, cyl == 6)
df[c('am', 'gear', 'carb')]
df$performance = df$hp / df$wt
help(round)
df$performance = round(df$performance, digits = 2)
head(df)
mean(subset(df, hp > 100 & wt > 2.5)$mpg)
df[['Hornet Sportabout', 'mpg']]
