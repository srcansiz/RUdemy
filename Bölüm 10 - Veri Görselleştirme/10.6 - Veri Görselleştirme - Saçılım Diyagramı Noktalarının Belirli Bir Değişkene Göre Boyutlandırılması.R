


par(mar=c(5,5,5,7) , xpd = TRUE)
plot(x = airquality$Ozone , y = airquality$Temp , 
     main = "Ozon ve Sıcaklık İlişkisi",
     xlab = "Ozon Değerleri" , 
     ylab = "Sıcaklk Değerleri" , 
     pch = 19,
     col = c('blue' , 'orange' , 'pink' , 'gray' , 'black')[as.factor(airquality$Month)],
     bty = "L",
     cex = 0.3
     )
legend(x = "topright" , legend = levels(as.factor(airquality$Month)) ,
       col = c('blue' , 'orange' , 'pink' , 'gray' , 'black'),
       pch = 19,
       inset = c(-0.2 , 0)
       )


par(mar=c(5,5,5,7.2) , xpd = TRUE)
plot(x = airquality$Ozone , y = airquality$Temp , 
     main = "Ozon ve Sıcaklık İlişkisi",
     xlab = "Ozon Değerleri" , 
     ylab = "Sıcaklk Değerleri" , 
     pch = 19,
     col = c('blue' , 'orange' , 'pink' , 'gray' , 'black')[as.factor(airquality$Month)],
     bty = "L",
     cex = airquality$Wind/10
)
legend(x = "topright" , legend = levels(as.factor(airquality$Month)) ,
       title = "Aylar",
       col = c('blue' , 'orange' , 'pink' , 'gray' , 'black'),
       pch = 19,
       inset = c(-0.2 , 0)
)
legend(x = "topright" , legend = c('Düşük' , 'Orta' , 'Yüksek') , 
       title = "Rüzgar Seviyesi",
       cex = 0.8,
       pt.cex = c(0.2 , 0.9 , 2 ),
       pch = 19,
       inset = c(-0.3 , 0.65)       
       )
