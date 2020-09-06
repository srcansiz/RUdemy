
## Pearson Korelasyon Testi

View(iris)

shapiro.test(iris$Sepal.Width)
shapiro.test(iris$Petal.Width)
shapiro.test(iris$Sepal.Length)

hist(iris$Petal.Width)
hist(iris$Sepal.Length)


cor(iris$Sepal.Width , iris$Sepal.Length , method = "pearson")

cor.test(iris$Sepal.Width , iris$Sepal.Length , method = "pearson")

# Korelasyon matrisi 
cor(iris[,1:4] , method = "pearson")



cor.test(iris$Sepal.Width , iris$Sepal.Length , method = "pearson" , alternative = "less")
cor.test(iris$Sepal.Width , iris$Sepal.Length , method = "pearson" , alternative = "greater")

## Kendall Rank Korelasyon Testi

hist(iris$Petal.Width)
hist(iris$Petal.Length)

cor.test(iris$Petal.Width , iris$Petal.Length , method = "kendall")
cor.test(iris$Petal.Width , iris$Petal.Length , method = "kendall" , 
         alternative = "less")
cor.test(iris$Petal.Width , iris$Petal.Length , method = "kendall" , 
         alternative = "greater")


cor.test(iris$Petal.Width , iris$Petal.Length , method = "pearson" , 
         alternative = "greater")

# Korelasyon matrisi 
cor(iris[,1:4] , method = "kendall")
