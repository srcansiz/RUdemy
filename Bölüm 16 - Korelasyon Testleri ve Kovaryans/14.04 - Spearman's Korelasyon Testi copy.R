
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




## Spearman Korelasyon Testi

x <-  c(2,3,4,1,1,3,4,5,1,2,2,3)
y <-  c(3,4,4,2,1,2,5,3,1,3,3,2)

cor.test(x , y , method = "spearman" )

cor(iris[,1:4] , method = "spearman")


plot(iris$Sepal.Length , iris$Sepal.Width)
plot(iris$Petal.Length , iris$Petal.Width)




