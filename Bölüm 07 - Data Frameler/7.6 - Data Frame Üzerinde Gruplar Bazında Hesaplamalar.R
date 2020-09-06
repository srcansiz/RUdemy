
View(iris)

setosa <- which(iris$Species == 'setosa')
versicolor <- which(iris$Species == 'versicolor')
virginica <- which(iris$Species == 'virginica')

meanSetosa <- mean(iris[ setosa , c('Sepal.Length')])
meanVersicolor <- mean(iris[ versicolor , c('Sepal.Length')])
meanVerginica <- mean(iris[ virginica , c('Sepal.Length')])

# Ortalamalar
meanSetosa;meanVersicolor;meanVerginica

aggregate(iris , by = list(iris$Species) , FUN = mean)
# Ortalama
aggregate(iris[1:4] , by = list(iris$Species) , FUN = mean)
# Standart Sapma
aggregate(iris[1:4] , by = list(iris$Species) , FUN = sd)
# Toplam
aggregate(iris[1:4] , by = list(iris$Species) , FUN = sum)


aggregate(iris[1:4] , by = list(iris$Species) , FUN = mean , na.rm = T)

