
hist(iris$Sepal.Length , 
     main = "Histgoran Grafiği Yoğunluk Eğrisi" , 
     xlab = "Değerler" , 
     ylab = "Yoğunluk Probs", 
     prob = T , 
     col = "orange")
lines(density(iris$Sepal.Length , adjust = 5))

hist(iris$Sepal.Length , 
     main = "Histgoran Grafiği Yoğunluk Eğrisi" , 
     xlab = "Değerler" , 
     ylab = "Yoğunluk Probs", 
     prob = T , 
     col = "orange")
lines(density(iris$Sepal.Length , adjust = 1) , 
      col = "gray" , lwd = 3 )

hist(iris$Sepal.Length , 
     main = "Histgoran Grafiği Yoğunluk Eğrisi" , 
     xlab = "Değerler" , 
     ylab = "Yoğunluk Probs", 
     prob = T , 
     col = "orange")
lines(density(iris$Sepal.Length , adjust = 1) , 
      col = "blue" , lwd = 2 , lty = 'dotted'  )
lines(density(iris$Sepal.Length , adjust = 3) , 
      col = "gray" , lwd = 3  ,)
