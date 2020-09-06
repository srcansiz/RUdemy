
View(mtcars)

height = table(mtcars$cyl)

barplot(height , names.arg = c("4 Silindir" , "6 Silindir" , "8 Silindir") )

barplot(height , names.arg = c("4 Silindir" , "6 Silindir" , "8 Silindir") ,
        col = "orange",
        border = "blue"
        )

barplot(height , names.arg = c("4 Silindir" , "6 Silindir" , "8 Silindir") ,
        col = "orange",
        border = "blue",
        horiz = TRUE,
        cex.axis = 0.8,
        cex.names = 0.8
)


barplot(height , names.arg = c("4 Silindir" , "6 Silindir" , "8 Silindir") ,
        col = "orange",
        border = "blue",
        horiz = FALSE,
        cex.axis = 0.8,
        cex.names = 0.8,
        axis.lty = 1
)


grup_f <- function(x){
  
      cey <- quantile(x)
      result <- character(length(x))
      
      grup_1 <-  which(x <= cey[2])
      grup_2 <-  which(x <= cey[3] & x > cey[2])
      grup_3 <-  which(x <= cey[4] & x > cey[3])
      grup_4 <-  which(x > cey[4] & x <= cey[5])
      
      result[grup_1] <- 'Grup 1'
      result[grup_2] <- 'Grup 2'
      result[grup_3] <- 'Grup 3'
      result[grup_4] <- 'Grup 4'
      
      return(result)
  
}

result <- grup_f(mtcars$mpg)
d <- table(result)
d

barplot(d , names.arg = c("Grup 1 " , "Grup 2" , "Grup 3" , "Grup 4") ,
        col = "orange",
        border = "blue",
        horiz = FALSE,
        cex.axis = 0.8,
        cex.names = 0.8,
        axis.lty = 1
)


result <- grup_f(mtcars$hp)
d <- table(result)
d

barplot(d , names.arg = c("Grup 1 " , "Grup 2" , "Grup 3" , "Grup 4") ,
        col = "orange",
        border = "blue",
        horiz = FALSE,
        cex.axis = 0.8,
        cex.names = 0.8,
        axis.lty = 1
)



quantile(mtcars$mpg)[2]



