
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



