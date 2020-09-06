

### Logistic Regresyon #########################

library(caret)
library(glmnet)
library(tidyverse)

placement["sl_no"] <- NULL
placement["salary"] <- NULL

table(placement$status)

dataPlaced <- placement %>% filter(status == "Placed")
dataNotPlaced <- placement %>% filter(status == "Not Placed")

nrow(dataPlaced)
nrow(dataNotPlaced)

set.seed(155)
dataPlacedIndex <- sample(1:nrow(dataPlaced) , size = 0.75*nrow(dataNotPlaced) )
set.seed(155)
dataNotPlacedIndex <- sample(1:nrow(dataNotPlaced) , size = 0.75*nrow(dataNotPlaced) )

trainPlaced <- dataPlaced[ dataPlacedIndex , ]
trainNotPlaced <- dataNotPlaced[ dataNotPlacedIndex , ]

trainSet <- rbind(trainPlaced , trainNotPlaced)
table(trainSet$status)


testPlaced <- dataPlaced[ -dataPlacedIndex , ]
testNotPlaced <- dataNotPlaced[ -dataNotPlacedIndex , ]

testSet <- rbind(testPlaced , testNotPlaced)
table(testSet$status)

?glm

## GLM ile Logistic Regresyon Modeli Oluşturma

# modelLogit <- glm(status ~ . , data = trainSet , family = binomial(link = "logit"))

modelLogit <- glm(status ~ . , data = trainSet , family = "binomial")
modelLogit
summary(modelLogit)

### ANOVA Değişken Deviance Değerleri 
anova(modelLogit)
summary(modelLogit)


## variable Importance 
varImp(modelLogit)


### Model Üzerinden Tahminler 

# install.packages("InformationValue")
library(InformationValue)

predictions1 <- predict(modelLogit , testSet , type = "response")
predictions2 <- plogis(predict(modelLogit , testSet))

cm <- InformationValue::confusionMatrix(testSet$status , predictedScores = predictions1)

accur <- (cm[1,1] + cm[2,2]) /sum(cm)
accur

errorRate <- (cm[1,2] + cm[2,1]) / sum(cm)
errorRate


### Optimal Cutoff value 
summary(predictions1)


optCutoff <- InformationValue::optimalCutoff(testSet$status , predictedScores = predictions1)
optCutoff

cmOpt <- InformationValue::confusionMatrix(testSet$status , 
                                           predictedScores = predictions1 ,
                                           threshold = optCutoff  )
cmOpt
accurOpt <- (cmOpt[1,1] + cmOpt[2,2]) /sum(cmOpt)
accurOpt
accur

cm
cmOpt

## Precision ve Recall Değerlerinin Hesaplanması 


cmOpt_1 <- InformationValue::confusionMatrix(testSet$status , 
                                           predictedScores = predictions1 ,
                                           threshold = optCutoff  )
cmOpt_1

names(cmOpt_1) <- c("Not Placed (Negative)" , "Placed (Positive)")
rownames(cmOpt_1) <- c("Not Placed (Negative)" , "Placed (Positive)")

cmOpt_1

precision_1 <- cmOpt_1[2,2] / (cmOpt_1[2,1] + cmOpt_1[2,2])
recall_1 <- cmOpt_1[2,2] / (cmOpt_1[1,2] + cmOpt_1[2,2])

cmOpt_2 <- InformationValue::confusionMatrix(testSet$status , 
                                             predictedScores = predictions1 ,
                                             threshold = optCutoff  )

names(cmOpt_2) <- c("Not Placed (Positive)" , "Placed (Negative)")
rownames(cmOpt_2) <- c("Not Placed (Positive)" , "Placed (Negative)")
cmOpt_2
precision_2 <- cmOpt_2[1,1] / (cmOpt_2[1,2] + cmOpt_2[1,1])
recall_2 <- cmOpt_2[1,1] / (cmOpt_2[2,1] + cmOpt_2[1,1])
precision_2;recall_2


# Sensitivity ve Specificity


# Positive class Placed
cmOpt_1

sensitivity_1  <- cmOpt_1[2,2] / (cmOpt_1[1,2] + cmOpt_1[2,2])
sensitivity_1

specifitcity_1 <- cmOpt_1[1,1] / (cmOpt_1[2,1] + cmOpt_1[1,1])
specifitcity_1


## F1 Skoru 

# Positive calss Palced
cmOpt_1
f1_1 <- 2 * ( (precision_1 * recall_1) / (precision_1 + recall_1) )
f1_1

# Positive class Not Placed
cmOpt_2
f1_2 <- 2 * ( (precision_2 * recall_2) / (precision_2 + recall_2) )
f1_2


### ROC Curve ve AUC (Area Under Curve)

## Gerekli Paket 
#  install.packages("pROC")

library(pROC)

?roc
rocModel_1 <- roc( testSet$status ~ predictions1)
# Control = negative class
# Case  = positive class

plot(rocModel_1)
cmOpt_1

## AUC Değeri ve ROC modeli
rocModel_1


### Caret paketi ile Confusion Matrix  

?caret::confusionMatrix

optCutoff
predictions1
table(testSet$status)

predictedClass <- ifelse(predictions1 > optCutoff , "Placed" , "Not Placed")
predictedClass <- as.factor(predictedClass)

## Positive class varsayılan olarak ilk class Not Placed
caret::confusionMatrix(predictedClass , reference = testSet$status )

## Positive class değiştirme Placed
caret::confusionMatrix(predictedClass , reference = testSet$status , positive = "Placed")


## Recall ve Precision ve F1 metriklerini ekleme
caret::confusionMatrix(predictedClass , reference = testSet$status , 
                       positive = "Placed" , mode = "prec_recall")

## Conf. mat. kaydetme ve içindeki değerlere erişme 
cmOpt_1_caret <- caret::confusionMatrix(predictedClass , reference = testSet$status , 
                       positive = "Placed" , mode = "prec_recall")

cmOpt_1_caret$byClass[1]


### Kappa İstatistiği ve McNemar Test İstatistiği

caret::confusionMatrix(predictedClass , reference = testSet$status , positive = "Placed")

## Kappa 0.1 - 0.2 - Kötü 
## Kappa 0.2 - 0.4 - Kötü idare eder 
## Kappa 0.4 - 0.6 - Orta
## Kappa 0.6 - 0.8 - İyi
## Kappa 0.8 - 1.0 - Mükemmel

## Mcnemar p-value > 0.05 Tahmin edilen ve gerçek değerler 
## birbirine benzer ilişkili. (Yani iyi bir model)


##### Regularization Yöntemleri İle Model Tuning

library(glmnet)
library(tidyverse)

summary(modelLogit)

head(placement)

## Dummy Değişken Oluşturma 

modelDataDummy <- model.matrix( ~ . , data = placement)
View(modelDataDummy)

modelDataDummy <- modelDataDummy[ , -1]
modelDataDummy <- as.data.frame(modelDataDummy)
dataPlacedDummy <- modelDataDummy %>% filter(statusPlaced == 1 )
dataNotPlacedDummy <- modelDataDummy %>% filter(statusPlaced == 0)

nrow(dataPlacedDummy)
nrow(dataNotPlacedDummy)

set.seed(155)
dataPlacedIndexDummy <- sample(1:nrow(dataPlacedDummy) , size = 0.75*nrow(dataNotPlacedDummy) )
set.seed(155)
dataNotPlacedIndexDummy <- sample(1:nrow(dataNotPlacedDummy) , size = 0.75*nrow(dataNotPlacedDummy) )

trainPlacedDummy <- dataPlacedDummy[ dataPlacedIndexDummy , ]
trainNotPlacedDummy <- dataNotPlacedDummy[ dataNotPlacedIndexDummy , ]

trainSetDummy <- rbind(trainPlacedDummy , trainNotPlacedDummy)
table(trainSetDummy$statusPlaced)


testPlacedDummy <- dataPlacedDummy[ -dataPlacedIndexDummy , ]
testNotPlacedDummy <- dataNotPlacedDummy[ -dataNotPlacedIndexDummy , ]

testSetDummy <- rbind(testPlacedDummy , testNotPlacedDummy)
table(testSetDummy$status)

### Regularization Adımları

library(glmnet)

y = trainSetDummy$statusPlaced

ncol(trainSetDummy)
X = trainSetDummy[, -15]
X = as.matrix(X)

modelLogitLassoCV <- cv.glmnet(X , y , alpha = 1 ,  family = "binomial" )
modelLogitLassoCV
modelLogitLassoCV$glmnet.fit
plot(modelLogitLassoCV)

modelLogitLassoCV$lambda.min
coef(modelLogitLassoCV , modelLogitLassoCV$lambda.min )
summary(modelLogit)


## Model Üzerinden Tahminler 

modelLogitLasso <- glmnet(X , y , alpha = 1 , lambda = modelLogitLassoCV$lambda.min, 
                          family = "binomial")
modelLogitLasso
modelLogit

modelLogitLasso$nulldev
deviance(modelLogitLasso)

testControl <- as.matrix(testSetDummy[, -15])
head(testControl)
actuals <- testSetDummy[,15]

# predictionsLasso <- predict(modelLogitLasso , testControl)
predictionsLasso <- predict(modelLogitLasso , testControl , type="response") # Skorlar elde edilir
predictionsLasso
library(InformationValue)
optimalCut <- InformationValue::optimalCutoff(actuals , predictedScores = predictionsLasso)
optimalCut

actualsLabeled <- ifelse(actuals == 1 , "Placed" , "Not Placed")
preditionsLabeled <- ifelse(predictionsLasso[,1] > optimalCut , "Placed" , "Not Placed")

library(caret)
caret::confusionMatrix(as.factor(preditionsLabeled) , as.factor(actualsLabeled) , 
                       positive = "Placed")

# Eski Model Lasso yok
caret::confusionMatrix(predictedClass , reference = testSet$status , positive = "Not Placed")

# Yeni modell Lasso var
caret::confusionMatrix(as.factor(preditionsLabeled) , as.factor(actualsLabeled) , 
                       positive = "Not Placed")


# Eski Model Lasso yok
caret::confusionMatrix(predictedClass , reference = testSet$status , positive = "Not Placed" ,
                       mode = "prec_recall")

# Yeni modell Lasso var
caret::confusionMatrix(as.factor(preditionsLabeled) , as.factor(actualsLabeled) , 
                       positive = "Not Placed" , mode = "prec_recall")

