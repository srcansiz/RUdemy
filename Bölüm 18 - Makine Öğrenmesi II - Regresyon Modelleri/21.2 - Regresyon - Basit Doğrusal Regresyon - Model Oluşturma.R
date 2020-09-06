

### Regresyon Modeli Oluştruma

View(airquality)

model <- lm( Ozone ~ Temp , data  = airquality)
model
summary(model)
