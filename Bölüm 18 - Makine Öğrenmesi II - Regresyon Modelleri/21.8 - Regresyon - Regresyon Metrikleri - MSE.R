
### Regresyon Metrikleri 

## Mean Squared Error 

model <- lm(Ozone ~ Temp , data = airquality , na.action = na.omit)

mse <- sum(model$residuals**2) / length(model$residuals)
mse


