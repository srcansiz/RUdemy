
#### Çoklu Doğrusal Regresyon 

### Australia Rain Dataset
### Nem oranı tahmin modeli

df_albury <- weatherAUS[ weatherAUS$Location == "Albury"  , ]
nrow(df_albury)

names(df_albury)
df_albury <- df_albury[c("Humidity9am" , "MinTemp" , 
                         "MaxTemp" , "WindSpeed9am" , "Pressure9am" , "Temp9am" , "Rainfall")]

cor(na.omit(df_albury))

pairs(na.omit(df_albury) , pch = 19)



##  Kayıp Gözlemeler

library(mice)

## Kayıp Gözlem Örüntüsü
md.pattern(df_albury)

## İmputation
imputed <- mice(df_albury , m = 5)
names(imputed)
imputed$imp

## Veri setini doldurma (Complate)
df_albury_Imputed <- complete(imputed , 3)
md.pattern(df_albury_Imputed)


## Çoklu Doğrusal Regresyon

set.seed(145)
sampleIndex <- sample(1:nrow(df_albury_Imputed) , size = 0.8*nrow(df_albury_Imputed))

trainSet <- df_albury_Imputed[sampleIndex , ]
testSet <- df_albury_Imputed[-sampleIndex , ]

View(trainSet)
names(trainSet)
model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)
# model1 <- lm(Humidity9am ~ . , data  = trainSet)

model1
summary(model1)

model2 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSet)
summary(model2)

AIC(model1 , k = 8)
AIC(model2 , k = 7)

BIC(model1)
BIC(model2)

# Artık plotları 
plot(model2)

testSet2 <- testSet[-5]

predictions <- predict(model2 , testSet2)

library(caret)

R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)

# Cook's Distance 

dist <- cooks.distance(model2)
olcut1 <- mean(dist)*3
olcut2 <- 4 / length(dist)

olcut1Index <- which(dist > olcut1)
olcut2Index <- which(dist > olcut2)

olcut1
length(olcut1Index)
length(olcut2Index)


plot(1:length(dist) , dist , type="p" , ylim = range(dist)*c(1,0.07))
abline( h = olcut1 , col = "red")


trainSetRemovedOut <- trainSet[-olcut1Index , ]

### Model Kaşılaştırmaları

model3 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
summary(model3)
summary(model2)

AIC(model3 , k = 7)
BIC(model3)
AIC(model2 , k = 7)
BIC(model2)

## Yeni Model
predictions3 <- predict(model3 , testSet2)
R2(predictions3 , testSet2$Humidity9am)
RMSE(predictions3 , testSet2$Humidity9am)
MAE(predictions3 , testSet2$Humidity9am)
# Eski Model
predictions <- predict(model2 , testSet2)
R2(predictions , testSet2$Humidity9am)
RMSE(predictions , testSet2$Humidity9am)
MAE(predictions , testSet2$Humidity9am)


## VIF Varyans Şişkinlik Faktörü

library(car)
?vif
vif(model3)

modelVif1 <- lm(Humidity9am ~ MinTemp + MaxTemp + 
               Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif1)

summary(modelVif1)
summary(model3)


modelVif2 <- lm(Humidity9am ~ MinTemp + Temp9am + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)
vif(modelVif2)
summary(modelVif2)


modelVif3 <- lm(Humidity9am ~ Temp9am + 
                  Rainfall + WindSpeed9am , data  = trainSetRemovedOut)

vif(modelVif3)
summary(modelVif3)

# Test veri seti üzerinden model değerlendirme 
predictionsVif3 <- predict(modelVif3 , testSet2)
R2(predictionsVif3 , testSet2$Humidity9am)
RMSE(predictionsVif3 , testSet2$Humidity9am)
MAE(predictionsVif3 , testSet2$Humidity9am)

predictionsVif2 <- predict(modelVif2 , testSet2)
R2(predictionsVif2 , testSet2$Humidity9am)
RMSE(predictionsVif2 , testSet2$Humidity9am)
MAE(predictionsVif2 , testSet2$Humidity9am)

predictionsVif1 <- predict(modelVif1 , testSet2)
R2(predictionsVif1 , testSet2$Humidity9am)
RMSE(predictionsVif1 , testSet2$Humidity9am)
MAE(predictionsVif1 , testSet2$Humidity9am)



### Aşamalı Regresyon StepWise Regression 


model1 <- lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
               Rainfall + WindSpeed9am + Pressure9am , data  = trainSet)

step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "forward" , scope = ~ MinTemp + MaxTemp + Temp9am + 
                                                    Rainfall + WindSpeed9am + Pressure9am )
## Burada presure9am çıakrtılıyor
step(lm(Humidity9am ~ 1 , data = df_albury_Imputed) , direction = "forward" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )


## Backward Geri DOğru gitme
step(lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
          Rainfall + WindSpeed9am + Pressure9am , data = trainSetRemovedOut) )
step(lm(Humidity9am ~ MinTemp + MaxTemp + Temp9am + 
          Rainfall + WindSpeed9am + Pressure9am , data = df_albury_Imputed) )

# Both / Çift Yönlü 
step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )
step(lm(Humidity9am ~ 1 , data = df_albury_Imputed) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )

# Model kaydetme
modelStep <- step(lm(Humidity9am ~ 1 , data = trainSetRemovedOut) , direction = "both" , scope = ~ MinTemp + MaxTemp + Temp9am + 
       Rainfall + WindSpeed9am + Pressure9am )

modelStep
