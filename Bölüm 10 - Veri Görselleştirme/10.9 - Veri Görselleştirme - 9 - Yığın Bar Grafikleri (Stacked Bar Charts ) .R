View(mtcars)


table(mtcars$gear , mtcars$cyl)
t <- table(mtcars$gear , mtcars$cyl)

par(mar=c(5.1,5.1,5.1,7) , xpd = TRUE)
barplot(t , 
        names.arg = c("4 Silindirli" , "6 Silindirli" , "8 Silindirli"),
        axis.lty = 1,
        main = "Bar Grafiği" , 
        xlab = "Silindir Değerleri" , 
        ylab = "Frekans Değerleri" , 
        col = c("orange" , "pink" , "gray"),
        legend = c("3 Vitesli" , "4 Vitesli" , "5 Vitesli"),
        args.legend = list(bty = "o" , 
                           horiz = TRUE , 
                           xjust = 0.5 , 
                           yjust = -0.7,
                           cex = 0.8)
        
)

table(mtcars$cyl , mtcars$gear)
t <- table(mtcars$cyl , mtcars$gear)

par(mar=c(5.1,5.1,5.1,7) , xpd = TRUE)
barplot(t , 
        names.arg = c("3 Vitesli" , "4 Vitesli" , "5 Vitesli"),
        axis.lty = 1,
        main = "Bar Grafiği" , 
        xlab = "Silindir Değerleri" , 
        ylab = "Frekans Değerleri" , 
        col = c("orange" , "pink" , "gray"),
        legend = c("4 Silindirli" , "6 Silindirli" , "8 Silindirli"),
        args.legend = list(bty = "o" , 
                           horiz = TRUE , 
                           xjust = 0.5 , 
                           yjust = -0.6,
                           cex = 0.8)
        
)


