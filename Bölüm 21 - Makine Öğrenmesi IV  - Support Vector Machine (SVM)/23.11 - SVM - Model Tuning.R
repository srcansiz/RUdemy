
breast.cancer <- read.csv('breast-cancer.csv')

modelData <- breast.cancer

str(modelData)
varNames <- names(modelData)
modelData <- modelData[, -which(varNames == 'X' | varNames == 'id')]
varNames <- names(modelData)

selectedVars <- c("diagnosis" ,  "radius_mean" ,"texture_mean"  ,         
                   "perimeter_mean"  ,"area_mean" ,"smoothness_mean" ,       
                  "compactness_mean" ,"concavity_mean", "concave.points_mean" ,
                  "symmetry_mean" ,"fractal_dimension_mean")

modelDataSelected <- modelData[selectedVars]
View(modelDataSelected)


plot(modelDataSelected$radius_mean , modelDataSelected$texture_mean , pch = 19,
      col = c('blue' , 'orange')[as.factor(modelDataSelected$diagnosis)] )


plot(modelDataSelected$area_mean , modelDataSelected$perimeter_mean , pch = 19,
     col = c('blue' , 'orange')[as.factor(modelDataSelected$diagnosis)] )

plot(modelDataSelected$smoothness_mean, modelDataSelected$compactness_mean , pch = 19,
     col = c('blue' , 'orange')[as.factor(modelDataSelected$diagnosis)] )

plot(modelDataSelected$radius_mean, modelDataSelected$compactness_mean , pch = 19,
     col = c('blue' , 'orange')[as.factor(modelDataSelected$diagnosis)] )

#### Model Oluşturma

#install.packages('e1071')
library(e1071)

?svm


### Diagnosis faktoröre çevrilmeli 

modelDataSelected$diagnosis <- as.factor(modelDataSelected$diagnosis)
class(modelDataSelected$diagnosis)


table(modelDataSelected$diagnosis)


set.seed(125)
trainIndex <- sample(1:nrow(modelDataSelected) , size = 0.8*nrow(modelDataSelected))

trainSet <- modelDataSelected[ trainIndex,]
testSet <- modelDataSelected[-trainIndex,]

table(trainSet$diagnosis)
table(testSet$diagnosis)

head(trainSet)

modelLinear <- svm( diagnosis ~ . , data  = trainSet , kernel = 'linear' )
modelRadial <- svm( diagnosis ~ . , data  = trainSet , kernel = 'radial' )

modelLinear
summary(modelLinear)
modelRadial$coefs
modelLinear$coefs
modelLinear$decision.values

## Modeller Üzerinden Tahminler


predLinear <- predict(modelLinear , testSet)
predRadial <- predict(modelRadial , testSet)


caret::confusionMatrix(predLinear , testSet$diagnosis)
caret::confusionMatrix(predRadial , testSet$diagnosis)

caret::confusionMatrix(predLinear , testSet$diagnosis , mode = "prec_recall")
caret::confusionMatrix(predRadial , testSet$diagnosis , mode = "prec_recall")


modelLinearP <- svm( diagnosis ~ . , data  = trainSet , kernel = 'linear' , probability = T)
modelRadialP <- svm( diagnosis ~ . , data  = trainSet , kernel = 'radial' , probability = T)

predLinearP <- predict(modelLinearP , testSet , probability = T)
attr(predLinearP , "probabilities")


## Sonuçların Görselleştirilmesi

plot(modelLinear , trainSet , radius_mean ~ texture_mean)
plot(modelLinear , testSet , radius_mean ~ texture_mean)
plot(modelLinear , testSet , perimeter_mean ~ area_mean)


plot(modelRadial , trainSet , radius_mean ~ texture_mean)
plot(modelRadial , testSet , radius_mean ~ texture_mean)
plot(modelRadial , testSet , perimeter_mean ~ area_mean)


###


## Model Tuning

library(e1071)

modelLinearTune <- tune(svm , diagnosis ~ . , data = trainSet ,
      kernel = "linear",
      ranges = list(gamma = 2^(-2:2) , cost = 2^(-4:2)),
      tunecontrol = tune.control(cross = 5)
     )
modelRadialTune <- tune(svm , diagnosis ~ . , data = trainSet ,
                        kernel = "radial",
                        ranges = list(gamma = 2^(-2:2) , cost = 2^(-4:2)),
                        tunecontrol = tune.control(cross = 5)
)

modelLinearTune
modelRadialTune

modelRadialTune$performances

predLinearTune <- predict(modelLinearTune$best.model , testSet)
predRadialTune <- predict(modelRadialTune$best.model , testSet)


caret::confusionMatrix(predLinearTune , testSet$diagnosis)
caret::confusionMatrix(predRadialTune , testSet$diagnosis)

caret::confusionMatrix(predLinearTune , testSet$diagnosis , mode = "prec_recall")
caret::confusionMatrix(predRadialTune , testSet$diagnosis , mode = "prec_recall")





