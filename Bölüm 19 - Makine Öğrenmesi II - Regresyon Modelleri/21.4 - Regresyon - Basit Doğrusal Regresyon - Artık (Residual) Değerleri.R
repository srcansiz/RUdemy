
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


