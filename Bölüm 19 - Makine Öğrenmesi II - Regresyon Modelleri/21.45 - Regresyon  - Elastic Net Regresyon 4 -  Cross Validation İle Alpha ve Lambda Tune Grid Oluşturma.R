
View(mtcars)

library(tidyverse)
library(glmnet)
library(caret)

modelData <- mtcars %>% mutate(
                    cyl = as.factor(cyl),
                    vs = as.factor(vs),
                    am = as.factor(am),
                    gear = as.factor(gear),
                    carb = as.factor(carb)
      )

class(modelData$cyl)

modelDataDummy <- model.matrix( ~ . , data  = modelData)
View(modelDataDummy)

set.seed(155)
sampleTrainIndex <- sample(1:nrow(modelDataDummy) , size = 0.75*nrow(modelDataDummy))

trainData <- modelDataDummy[sampleTrainIndex , ]
testData <- modelDataDummy[-sampleTrainIndex , ]

trainDataX <- trainData[, -c(1,2)]
trainDataY <- trainData[, 2]

testDataX <- testData[, -c(1,2)]
testDataY <- testData[, 2]

lambdas <- 10^seq(2,-2 , by = -0.01)

fitGL <- glmnet(trainDataX , trainDataY , alpha = 1 , lambda = lambdas) 
fitGL

plot(fitGL , xvar = "lambda")
legend("bottomright" , lwd = 1 , col = 1:nrow(trainDataX) , legend = colnames(trainDataX) )


## Cross Validation

nrow(trainDataX)
fitGLCV <- cv.glmnet(trainDataX , trainDataY , alpha = 1 , lambda = lambdas , nfolds = 3 )
plot(fitGLCV)

best_lambda <- fitGLCV$lambda.min

### Model Tahmin PErformans Değerlendirmesi 



fitGlLasso <- glmnet(trainDataX , trainDataY , alpha = 1 , lambda = best_lambda) 

fitGlLasso$beta
fitGlLasso

predictions <- predict(fitGlLasso , testDataX)

R2(predictions , testDataY)
MAE(predictions , testDataY)
RMSE(predictions , testDataY)


fitGlOLS<- glmnet(trainDataX , trainDataY , alpha = 1 , lambda = 0)
fitGlOLS$beta


predictionsOLS <- predict(fitGlOLS , testDataX)

R2(predictionsOLS , testDataY)
MAE(predictionsOLS , testDataY)
RMSE(predictionsOLS , testDataY)

###################################################
## Elastic Net Regression  Model Oluşturma 

fitElastic<- glmnet(trainDataX , trainDataY , alpha = 0.5 , lambda = lambdas)
fitElastic

plot(fitElastic , xvar = "lambda")

# cv.glmnet()


### Elsatic Net Cross Validation  

library(caret)

trControl = trainControl(method = "repeatedcv" , number = 3 , 
             repeats = 5 , 
             search = "random",
             verboseIter = TRUE , )


fitElasCV <- train(trainDataX , trainDataY ,  method = "glmnet" , 
                   tuneLength = 30 , 
                   trControl = trControl)

fitElasCV
fitElasCV$bestTune
fitElasCV$finalModel

## Elastic Net Cross Validation Alpha ve Lambda Değerleri İle

trControlGrid = trainControl(method = "repeatedcv" , number = 3 , 
                         repeats = 5 , 
                         verboseIter = TRUE , )

gridAlphaLambda <- expand.grid(
                                .lambda = seq(0 , 0.5 , by = 0.01),
                                .alpha = seq(0 , 3 , by= 0.01) 
                                )
gridAlphaLambda

fitElasCVGrid <- train(trainDataX , trainDataY ,  method = "glmnet" , 
                   tuneGrid = gridAlphaLambda , 
                   trControl = trControl)
fitElasCVGrid$bestTune
fitElasCVGrid$finalModel
fitElasCV$bestTune

modelLookup(model = "glmnet")








