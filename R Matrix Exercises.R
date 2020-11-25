A = c(1, 2, 3)
B = c(4, 5, 6)
rbind(A,B)
mat = matrix(1:9, byrow = TRUE, nrow = 3,)
is.matrix(mat)
mat2 = matrix(1:25, byrow = TRUE, nrow = 5)
mat2[2:3, 2:3]
mat2[4:5, 4:5]
sum(mat2)
help(runif)
random = runif(20, 1, 100)
mat3 = matrix(random, nrow = 4)
