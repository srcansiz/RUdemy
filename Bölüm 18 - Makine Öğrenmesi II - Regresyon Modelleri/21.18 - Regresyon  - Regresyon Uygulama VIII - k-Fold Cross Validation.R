
### Regresyon Uygulama 1 - Train ve Test Ayırma 

model_data <- kc_house_data[c("price" ,"sqft_living")]

View(model_data)

# random sample 

set.seed(145)
sampleIndex <- sample(1:nrow(model_data) , size = 0.8*nrow(model_data))

trainSet <- model_data[sampleIndex , ]
testSet <- model_data[-sampleIndex , ]

nrow(trainSet)
nrow(testSet)


### Train Veri Seti Incelemeleri ve Aykırı Değer Kontrolü 

cor(trainSet)

hist(trainSet$price)
hist(trainSet$sqft_living)


library(ggplot2)

fig  <- ggplot(data  = trainSet , aes(x = sqft_living , y =  price)) +
  geom_point(size = 2) + 
  ylab("Fiyatlar") + xlab("Salon Büyüklüğü")
fig        

library(outliers)

scores <- scores(trainSet , type = "z" , prob = 0.95)

anyTrue <- apply(scores , 1 , FUN = function(x) { any(x) }  )

index <- which(anyTrue)

trainSetRemovedOut <- trainSet[-index , ]

nrow(trainSet)
nrow(trainSetRemovedOut)

fig2  <- ggplot(data  = trainSetRemovedOut , aes(x = sqft_living , y =  price)) +
  geom_point(size = 2) + 
  ylab("Fiyatlar") + xlab("Salon Büyüklüğü")
fig2

cor(trainSetRemovedOut)

# Kayıp gözlem kontrolü
library(mice)
md.pattern(trainSet)


### Model Oluşturma ve Değerlendirme


model1 <- lm(price ~ sqft_living , data  = trainSet)
model2 <- lm(price ~ sqft_living , data  = trainSetRemovedOut)

summary(model1)
summary(model2)

AIC(model1)
AIC(model2)
BIC(model1)
BIC(model2)

## Prediction

model1Pred <- predict(model1, testSet)
model2Pred <- predict(model2, testSet)

model1PredData <- data.frame("actuals" = testSet$price , "predictions" = model1Pred)
model2PredData <- data.frame("actuals" = testSet$price , "predictions" = model2Pred)
View(model1PredData)
View(model2PredData)

model1Hata <- model1PredData$actuals - model1PredData$predictions
model2Hata <- model2PredData$actuals - model2PredData$predictions

mse1 <- sum(model1Hata^2) / nrow(model1PredData)
mse2 <- sum(model2Hata^2) / nrow(model2PredData)

sqrt(mse1);sqrt(mse2)

## R2 RMSE VE MAE

install.packages("caret")
library(caret)

R2(model1PredData$predictions , model1PredData$actuals )
R2(model2PredData$predictions , model2PredData$actuals )

RMSE(model1PredData$predictions , model1PredData$actuals )
RMSE(model2PredData$predictions , model2PredData$actuals )

MAE(model1PredData$predictions , model1PredData$actuals )
MAE(model2PredData$predictions , model2PredData$actuals )


## Min - Max Accuracy 

model1MinMaxAccur <- mean(apply(model1PredData , 1 , min) / apply(model1PredData , 1 , max) )
model1MinMaxAccur


model2MinMaxAccur <- mean(apply(model2PredData , 1 , min) / apply(model2PredData , 1 , max) )
model2MinMaxAccur


## Mean Absolute  Percentage Error (MAPE)

model1MAPE <- mean( abs(model1PredData$actuals - model1PredData$predictions) /  
                      model1PredData$actuals)

model2MAPE <- mean( abs(model2PredData$actuals - model2PredData$predictions) /  
                      model2PredData$actuals)

model1MAPE;model2MAPE


### K-Fold Cross Validation #####################3

library(caret)

train.control <- trainControl(method = "cv" , number  = 10 , verboseIter = TRUE)

model1CV <- train(price ~ sqft_living , data = trainSet , method = "lm" ,
      trControl = train.control
      )

model2CV <- train(price ~ sqft_living , data = trainSetRemovedOut , method = "lm" ,
                  trControl = train.control
)
model1CV
model2CV


model1CVPred <- predict(model1CV , testSet)
model2CVPred <- predict(model2CV , testSet)

caret::R2(model1CVPred , testSet$price)
caret::R2(model2CVPred , testSet$price)

caret::RMSE(model1CVPred , testSet$price)
caret::RMSE(model2CVPred , testSet$price)

