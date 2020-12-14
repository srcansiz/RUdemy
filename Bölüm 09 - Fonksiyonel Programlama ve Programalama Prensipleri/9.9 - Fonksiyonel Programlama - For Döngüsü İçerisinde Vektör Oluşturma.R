View(iris)

min(iris$Petal.Length)
max(iris$Petal.Length)
mean(iris$Petal.Length)

x <- character(length(iris$Petal.Length))


for(i in 1:length(x)){
  
    if(iris$Petal.Length[i] >= 3 ){
      x[i] <- 'Büyüktür'
    }else{
      x[i] <- 'Küçüktür'
    }
  
}


iris$Var2 <- x
View(iris)
