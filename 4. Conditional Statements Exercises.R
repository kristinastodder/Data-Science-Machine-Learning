x = 1
if (x==1){
  print("Hello")}
 
x = 3
if (x%%2 == 0){
  print("Even")
} else{
    print("Not Even")}

help(is.matrix)
x = matrix()
if (is.matrix(x)){
  print("Is a Matrix")
} else{
    print("Not a Matrix")}

x = c(3, 7, 1)
if (x[1] > x[2]){
  #first, second place
  a = x[1]
  b = x[2]
}else{
  a = x[2]
  b = x[1]
}
if (x[3] > a & x[3] > b){
  #3rd was largest
  c = b
  b = a
  a = x[3]
}else if (x[3] < a & x[3] < b){
  #3rd was smallest
  c = x[3]
}else {
    c = b 
    b = x[3]
    }
print(paste(a, b, c))  



x = c(20, 10, 10)
if (x[1] > x[2] & x[1] > x[3]){
  print(x[1])
}else if (x[2] > x[1] & x[2] > x[3]){
  print(x[2])
}else {print(x[3])
}
  
  
