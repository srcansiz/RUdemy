
### Basit Doğrusal Regresyon

View(airquality)

model <- lm(Ozone ~ Temp , data = airquality)
model

# y = -146.995 + 2.429Temp 

summary(model)

# Ho : paramterenin anlamlı bir etkisi yoktur
# ha : anlamlı etkisi

## Artık Değerler

artık <- as.numeric(model$residuals)
plot(artık)

plot(model)


## Mahalonobis Distance Aykırı Değer Kontrolü

plot(airquality$Ozone , airquality$Temp)

summary(model)

air <- na.omit(airquality[c("Ozone" , "Temp")])
View(air)

air.center = colMeans(air)
air.center
air.cov = cov(air)
air.cov

## Mahlonobis Distance
distance <- mahalanobis(air , center = air.center , cov = air.cov)
distance

## Eşik değeri
cutoff <- qchisq(p = 0.95 , df = 2)
cutoff

index <- which(distance > cutoff)
air[index,]

## Aykırı değerlerin çıkartılması
air_new <- air[-index , ]

## Aykırı değerler çıkartıldıktan sonraki model
model2 <- lm(Ozone ~ Temp , data  = air_new)
model2

model # Eski model

summary(model2)
plot(model2)

