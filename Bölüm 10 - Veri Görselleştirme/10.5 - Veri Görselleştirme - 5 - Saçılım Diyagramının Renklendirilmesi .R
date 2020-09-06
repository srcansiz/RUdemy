

View(airquality)

plot( x = airquality$Ozone , y = airquality$Temp , 
      pch = 19 , bty = "L" , 
      main = "Saçılım Grafiği ve Renkeler", 
      xlab = "Ozon Değerleri",
      ylab = "Sıcaklık Değerleri"
      )

# Bütün Renklerin Değiştirilmesi
plot( x = airquality$Ozone , y = airquality$Temp , 
      pch = 19 , bty = "L" , 
      main = "Saçılım Grafiği ve Renkeler", 
      xlab = "Ozon Değerleri",
      ylab = "Sıcaklık Değerleri",
      col = "orange"
)

plot( x = airquality$Ozone , y = airquality$Temp , 
      pch = 19 , bty = "L" , 
      main = "Saçılım Grafiği ve Renkeler", 
      xlab = "Ozon Değerleri",
      ylab = "Sıcaklık Değerleri",
      col = "blue"
)

class(airquality$Month)
levels(as.factor(airquality$Month))

renkler <- c('blue' , 'orange' , 'pink' , 'gray' , 'black')[as.factor(airquality$Month)]
# Gruplara göre renklendirme
plot( x = airquality$Ozone , y = airquality$Temp , 
      pch = 19 , bty = "L" , 
      main = "Saçılım Grafiği ve Renkeler", 
      xlab = "Ozon Değerleri",
      ylab = "Sıcaklık Değerleri",
      col = renkler
)
plot( x = airquality$Ozone , y = airquality$Temp , 
      pch = 19 , bty = "L" , 
      main = "Saçılım Grafiği ve Renkeler", 
      xlab = "Ozon Değerleri",
      ylab = "Sıcaklık Değerleri",
      col = c('blue' , 'orange' , 'pink' , 'gray' , 'black')[as.factor(airquality$Month)]
)
legend(x = 'topright' , legend = levels(as.factor(airquality$Month)) ,
                      col = c('blue' , 'orange' , 'pink' , 'gray' , 'black') ,
                      pch = 19
       
       )


par(mar=c(6,6,6,7) , xpd = TRUE)
plot( x = airquality$Ozone , y = airquality$Temp , 
      pch = 19 , bty = "L" , 
      main = "Saçılım Grafiği ve Renkeler", 
      xlab = "Ozon Değerleri",
      ylab = "Sıcaklık Değerleri",
      col = c('blue' , 'orange' , 'pink' , 'gray' , 'black')[as.factor(airquality$Month)]
)
legend(x = 'topright' , legend = levels(as.factor(airquality$Month)) ,
       col = c('blue' , 'orange' , 'pink' , 'gray' , 'black') ,
       pch = 19,
       inset = c(-0.2 , 0.1)
)






