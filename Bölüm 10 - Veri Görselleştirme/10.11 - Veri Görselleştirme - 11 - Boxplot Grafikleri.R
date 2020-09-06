

View(mtcars)

boxplot(mtcars[,c("drat" , "wt")] , 
        main = "Box Plot Grafiği",
        xlab = "Değişkenler" , 
        ylab = "Değerler",
        names = c("Drat Değişkeni" , "WT Değişkeni") ,
        col = c("orange" , "cyan"),
        border = "gray",
        pch = 19,
        cex.axis = 0.7,
        range = 0.5, 
        outline = T
        
        )


boxplot(mtcars[,c("drat" , "wt")] , 
        main = "Box Plot Grafiği",
        xlab = "Değişkenler" , 
        ylab = "Değerler",
        names = c("Drat Değişkeni" , "WT Değişkeni") ,
        col = c("orange" , "cyan"),
        border = "gray",
        pch = 19,
        cex.axis = 0.7,
        range = 0.5, 
        outline = F
)


boxplot(mtcars[,c("drat" , "wt")] , 
        main = "Box Plot Grafiği",
        xlab = "Değişkenler" , 
        ylab = "Değerler",
        names = c("Drat Değişkeni" , "WT Değişkeni") ,
        col = c("orange" , "cyan"),
        border = "gray",
        pch = 19,
        cex.axis = 0.7,
        range = 1.5, 
        outline = T
)



boxplot( mtcars$mpg ~ mtcars$gear , 
        main = "Box Plot Grafiği",
        xlab = "Vites Değerleri" , 
        ylab = "MPG Değerleri",
        col = c("orange"),
        border = "gray",
        pch = 19,
        cex.axis = 0.9,
        outline = T
)

boxplot( mtcars$mpg ~ mtcars$gear*mtcars$cyl , 
         main = "Box Plot Grafiği",
         xlab = "Vites Değerleri" , 
         ylab = "MPG Değerleri",
         names = c("3V 4S" , "4V 4S" , "5V 4S" ,
                   "3V 6S" , "4V 6S" , "5V 6S",
                   "3V 8S" , "4V 8S" , "5V 8S"
                   ),
         col = c("orange"),
         border = "gray",
         pch = 19,
         cex.axis = 0.9,
         outline = T
)

legend()

