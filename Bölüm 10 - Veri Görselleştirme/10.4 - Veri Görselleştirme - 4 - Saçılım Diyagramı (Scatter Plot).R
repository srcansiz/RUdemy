
# Saçılım Diagramı - Scatter Plot 

View(airquality)

plot(airquality$Ozone , bty = "L")
plot(airquality$Ozone , pch = 'b' )
plot(airquality$Ozone , pch =  19 , type = 'h')

plot(airquality$Ozone , pch =  19 , type = 'l')
plot(airquality$Ozone , pch =  19 , type = 'b')
plot(airquality$Ozone , pch =  19 , type = 'c')
plot(airquality$Ozone , pch =  19 , type = 'o')
plot(airquality$Ozone , pch =  19 , type = 's')

plot( x = airquality$Ozone , y = airquality$Temp , pch = 19 , tpye = "p")

plot( x = airquality$Ozone , y = airquality$Temp , pch = 19 , type = "p" ,
       main = "Saçılım Diyagramı",
       xlab = "Ozon Değerleri",
       ylab = "Sıcaklık değerleri",
       bty = "L"
      )




