hello_you = function(name){
  print(paste('Hello',name))
}
hello_you('Sam')

hello_you2 = function(name){
  return(paste('Hello', name))
}
print(hello_you2('Sam'))

adding = function(num1, num2){
  add = num1 + num2
  return(add)
}
result = adding(2,7)
print(result)

productfunction = function(num1, num2){
  prod = num1 * num2
  return(prod)
}
prod(3,4)

num_check = function(x, y){
  for (item in y){
    if (item == x){
      return(TRUE)
    }
  }
  return(FALSE)
}
num_check(2, c(1, 2, 3))
num_check(2, c(1, 4, 5))

num_count = function(x, y){
  count = 0
  for (item in y){
    if (item == x){
      count = count + 1
    }
  }
  return(count)
}
num_count(2, c(1,1,2,2,3,3))
num_count(1, c(1,1,2,2,3,1,4,5,5,2,2,1,3))


bar_count = function(pack){
  amount.of.ones = pack %% 5
  amount.of.fives = (pack- amount.of.ones)/5
  return(amount.of.ones + amount.of.fives)
}
bar_count(6)
bar_count(17)


summer = function(x, y, z){
  out = c(0)
  if (x %% 3 != 0){
    out = append(x, out)
    }
  if (y %% 3 !=0){
    out = append(y, out)
  }
  if (z %% 3 != 0){
    out = append(z, out)
  }
  return(sum(out))
}
summer(7, 2, 3)
summer(3, 6, 9)
summer(9, 11, 12)

prime_check = function(x){
  if (x == 2){
    return(TRUE)
  }
  else if (any(x %% 2:(x-1) == 0)){
    return(FALSE)}
  else {
    return(TRUE)}
}

prime_check(2)
prime_check(5)
prime_check(4)
prime_check(237)
prime_check(131)
