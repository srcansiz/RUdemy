
## Karar Ağaçları (Decision Trees) CART
########################################
install.packages("rpart")
library(rpart)

install.packages("rattle")
library(rattle)

diabetes <- read.csv("diabetes.csv")
View(diabetes)

library(mice)
md.pattern(diabetes)


table(diabetes$Outcome)

set.seed(165)
trainIndex <- sample(1:nrow(diabetes) , size = 0.8*nrow(diabetes))

trainSet <- diabetes[trainIndex,]
testSet <- diabetes[-trainIndex,]

nrow(trainSet)
nrow(testSet)
table(trainSet$Outcome)
table(testSet$Outcome)

### Model Oluşturma

trainSet$Outcome <- as.factor(trainSet$Outcome)
testSet$Outcome <- as.factor(testSet$Outcome)

modelEntropy <- rpart(Outcome ~ . , data = trainSet , method = "class" , 
                  parms = list(split = "information"))

modelEntropy2 <- rpart(Outcome ~ . , data = trainSet , method = "class" , 
                      parms = list(split = "information"))

modelGini <- rpart(Outcome ~ . , data = trainSet , method = "class" , 
                      parms = list(split = "gini"))

modelEntropy
modelEntropy2
modelGini

### Karar Ağacının Görselleştirilmesi

fancyRpartPlot(modelEntropy)

modelEntropy

### Model Detayları 

summary(modelEntropy)
summary(modelGini)

### Karar Ağaçları Hiper Parametreleri



?rpart.control

modelEntropyHyper <- rpart(Outcome ~ . , data = trainSet , method = "class" , 
                      parms = list(split = "information") ,
                      control = rpart.control(minsplit = 40 , cp = 0.02 , maxdepth = 5))

modelEntropyHyper


### Tahmin


predModelEntropy <- predict(modelEntropy , testSet , type = "class")
predModelGini <- predict(modelGini , testSet , type = "class")
predModelEntropyHyper <- predict(modelEntropyHyper , testSet , type="class")

library(caret)

confusionMatrix(predModelEntropy , testSet$Outcome)
confusionMatrix(predModelEntropy , testSet$Outcome , mode = "prec_recall")
confusionMatrix(predModelEntropy , testSet$Outcome , mode = "prec_recall" , positive = "1")


confusionMatrix(predModelGini , testSet$Outcome)
confusionMatrix(predModelGini , testSet$Outcome , mode = "prec_recall")
confusionMatrix(predModelGini , testSet$Outcome , mode = "prec_recall" , positive = "1")


confusionMatrix(predModelEntropyHyper , testSet$Outcome)
confusionMatrix(predModelEntropyHyper , testSet$Outcome , mode = "prec_recall")
confusionMatrix(predModelEntropyHyper , testSet$Outcome , mode = "prec_recall" , positive = "1")


