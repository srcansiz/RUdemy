
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

distance <- mahalanobis(air , center = air.center , cov = air.cov)
distance

cutoff <- qchisq(p = 0.95 , df = 2)
cutoff

index <- which(distance > cutoff)
air[index,]

air_new <- air[-index , ]

model2 <- lm(Ozone ~ Temp , data  = air_new)
model2
model

summary(model2)
plot(model2)


### Dönüşümler ################

par(mfrow=c(2,2))
plot(model2)


model_log <- lm(Ozone ~ log(Temp) , data = air_new)
summary(model_log)

plot(model_log)
dev.off()


model_sqrt <- lm(Ozone ~ sqrt(Temp) , data = air_new)
summary(model_sqrt)

plot(model_log)


model_sqrt <- lm(sqrt(Ozone) ~ sqrt(Temp) , data = air_new)
summary(model_sqrt)
plot(model_sqrt)


