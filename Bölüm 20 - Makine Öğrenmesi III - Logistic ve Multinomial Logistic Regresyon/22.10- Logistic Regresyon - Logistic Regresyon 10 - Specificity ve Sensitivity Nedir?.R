

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

