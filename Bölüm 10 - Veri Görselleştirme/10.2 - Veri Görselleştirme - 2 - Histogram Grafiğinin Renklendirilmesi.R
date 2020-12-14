
# Histogram Grafiğinin Renklendirilmesi

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     col = "blue")

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     col = "orange")

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     col = "pink")

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     col = "#2ecc71")

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     col = "#3498db")


hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     col = c("#3498db" , "#2ecc71" , "#9b59b6")
     
     )

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     breaks = 15,
     col = c("#3498db" , "#2ecc71" , "#9b59b6")
     
     )

hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     breaks = 30,
     col = c("#3498db" , "#2ecc71" , "#9b59b6")
     
     )


hist(iris$Sepal.Length , 
     main = "Histogram Grafiği" ,
     xlab = "X Ekseni", 
     ylab = "Y Ekseni" , 
     breaks = 30,
     col = c("#3498db")
     
     )
