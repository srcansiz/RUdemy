

# Lineer Doğru ve Lowess Doğrusu
airquality <- na.omit(airquality)


par(mar=c(5,5,5,7.2) , xpd = FALSE)
plot(x = airquality$Ozone , y = airquality$Temp , 
     main = "Ozon ve Sıcaklık İlişkisi" , 
     xlab = "Ozon Değerleri" , 
     ylab = "Sıcaklık Değerleri" , 
     pch = 19 , 
     bty = "L" , 
     col = c('blue' , 'orange' , 'pink' , 'gray' , 'black')[as.factor(airquality$Month)],
     cex = airquality$Wind/10
       )
abline( lm(airquality$Temp ~ airquality$Ozone ) , lwd = 2 , lty = "dotted", col= "black" ) 
lines(lowess(airquality$Ozone , airquality$Temp) , lwd = 2 , col = "blue")

par(xpd = TRUE)
legend( x = "topright" , legend = levels(as.factor(airquality$Month)) ,
        title = "Aylar",
        col = c('blue' , 'orange' , 'pink' , 'gray' , 'black'),
        pch = 19,
        inset = c(-0.2 , 0)
        )
legend( x = "topright" , legend = c("Düşük" , 'Orta' , 'Yüksek') , 
        title = "Rüzgar Seviyeleri",
        pch = 19, 
        cex = 0.8,
        pt.cex = c(0.2 , 0.9 , 2),
        inset = c(-0.35 , 0.6)
        )

lowess(airquality$Ozone , airquality$Temp)


