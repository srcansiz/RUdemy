
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


trainSetRmeovedOut <- trainSet[-olcut1Index , ]



