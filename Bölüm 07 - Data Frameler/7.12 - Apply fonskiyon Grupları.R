

View(iris)

apply(iris[1:4] , MARGIN = 1 , FUN = mean)

# Sağlama işlemi
iris[1 , 1:4]
class(iris[1 , 1:4])
as.numeric(iris[1 , 1:4])
mean(as.numeric(iris[1 , 1:4]))

apply(iris[1:4] , MARGIN = 1 , FUN = sd)
sd(as.numeric(iris[1 , 1:4]))

apply(iris[1:4] , MARGIN = 1 , FUN = sum)


apply(iris[1:4] , MARGIN = 2 , FUN = sd)
apply(iris[1:4] , MARGIN = 2 , FUN = mean)
apply(iris[1:4] , MARGIN = 2 , FUN = sum)
apply(iris[1:4] , MARGIN = 2 , FUN = max)
apply(iris[1:4] , MARGIN = 2 , FUN = min)

lapply(iris, FUN = mean)

l <- list('a' = c(13,24,55,67,89,90) , 
          'b' = c(13,45,65,23,45) , 
          'c' = c(11,22,34,23,12))
lapply(l , FUN = mean)
lapply(l , FUN = sd)
lapply(l , FUN = max)
