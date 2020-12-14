

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


