

View(iris)

hist(iris$Sepal.Length)


hist(
     iris$Sepal.Length , 
     main = "Histogram Grafiği" , 
     xlab = "Değişken Değerleri" , 
     ylab = "Frekans Değerleri" )

hist(
      iris$Sepal.Length , 
      main = "Histogram Grafiği" , 
      xlab = "Değişken Değerleri" , 
      ylab = "Frekans Değerleri" , 
      breaks = 30
      
    )

hist(
  iris$Sepal.Length , 
  main = "Histogram Grafiği" , 
  xlab = "Değişken Değerleri" , 
  ylab = "Frekans Değerleri" , 
  breaks = 30,
  xlim = c(0,15)
  
)

hist(
  iris$Sepal.Length , 
  main = "Histogram Grafiği" , 
  xlab = "Değişken Değerleri" , 
  ylab = "Frekans Değerleri" , 
  breaks = 30,
  xlim = c(0,15),
  ylim = c(0,30)
  
)





