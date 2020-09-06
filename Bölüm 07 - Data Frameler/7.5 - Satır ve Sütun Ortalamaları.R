
data()

View(iris)

d1 <- rowMeans(iris[1:4])

iris['Ortalama'] <- d1

View(iris)
d2 <- rowMeans(iris[1:2] , na.rm = T)
iris['Ortalama2'] <- d2
View(iris)

colMeans(iris[1:4]  , na.rm = T)



