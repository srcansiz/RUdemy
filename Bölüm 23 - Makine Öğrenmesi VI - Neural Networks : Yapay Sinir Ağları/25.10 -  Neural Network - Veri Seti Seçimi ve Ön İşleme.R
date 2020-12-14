

### Neural Networks - Yapay Sinir Ağları

install.packages("neuralnet")
library(neuralnet)

diabetes <- read.csv("diabetes.csv")
View(diabetes)

modelData <- diabetes
modelData$Outcome <- as.factor(modelData$Outcome)

library(caret)

modelScale <- preProcess(modelData , method = c("center" , "scale"))

modelDataScaled <- predict(modelScale , modelData)
View(modelDataScaled)

set.seed(165)
trainIndex <- sample(1:nrow(modelDataScaled) , size = 0.75*nrow(modelDataScaled))

trainSet <- modelDataScaled[ trainIndex ,]
testSet <- modelDataScaled[ -trainIndex ,]

nrow(trainSet)
nrow(testSet)

table(trainSet$Outcome)
table(testSet$Outcome)




