#install.packages("outliers")
library(outliers)

?scores

## Z Dağılımına (Normal Dağılım) göre aykırı değer 
View(airquality)
out <- scores(na.omit(airquality$Ozone) , type = "z" , prob = 0.95)
ids <- which(out  == TRUE)
na.omit(airquality$Ozone)[ids]
hist(airquality$Ozone)
par(mfrow=c(2,1))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone)[-ids])

## T Dağılımna Göre Aykırı Değer
View(airquality)
out <- scores(na.omit(airquality$Ozone) , type = "t" , prob = 0.95)
ids <- which(out  == TRUE)
na.omit(airquality$Ozone)[ids]
hist(airquality$Ozone)
par(mfrow=c(2,1))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone)[-ids])

## Chi-square Dağılımına Göre Aykırı Değer
out <- scores(na.omit(airquality$Ozone) , type = "chisq" , prob = 0.95)
ids <- which(out  == TRUE)
na.omit(airquality$Ozone)[ids]
hist(airquality$Ozone)
par(mfrow=c(2,1))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone)[-ids])


# IQR Değrelerine Göre Aykırı Değer
out <- scores(na.omit(airquality$Ozone) , type = "iqr" , prob = 0.95)
ids <- which(out  == TRUE)
na.omit(airquality$Ozone)[ids]

hist(airquality$Ozone)

par(mfrow=c(2,1))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone)[-ids])

#Medyan Değerine Göre Aykırı Değer
out <- scores(na.omit(airquality$Ozone) , type = "mad" , prob = 0.95)
ids <- which(out  == TRUE)
na.omit(airquality$Ozone)[ids]

hist(airquality$Ozone)

par(mfrow=c(2,1))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone)[-ids])

