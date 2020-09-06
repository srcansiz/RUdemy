
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
