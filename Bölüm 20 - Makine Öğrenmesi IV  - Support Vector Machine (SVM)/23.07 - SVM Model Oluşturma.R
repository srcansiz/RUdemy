
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

## Görselleştirlemler 


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
