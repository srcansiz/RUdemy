
View(iris)

hist(iris$Sepal.Length)

shapiro.test(x = iris$Sepal.Length)
shapiro.test(x = iris$Sepal.Width)

par(mfrow= c(1 ,2))
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)


r <- rnorm(n = length(iris$Sepal.Length) , mean = 0 , sd = 1)
r2 <- rnorm(n = length(iris$Sepal.Length) , mean = mean(iris$Sepal.Length) , 
            sd =  sd(iris$Sepal.Length ))

ks.test(x = iris$Sepal.Length , y  = r )


ks.test(x = iris$Sepal.Length , y  = r2 )

ks.test(x = iris$Sepal.Length , "pnorm" , mean = 0 , sd = 1 )


