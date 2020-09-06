

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


## NN Modeli Eğitim Aşaması 

?neuralnet

modelNN_1 <- neuralnet(Outcome ~ . , data = trainSet , 
                       hidden = 1 , threshold = 0.01 , 
                       act.fct = "logistic",
                       linear.output = FALSE
                       )
modelNN_1
plot(modelNN_2)
modelNN_2 <- neuralnet(Outcome ~ . , data = trainSet , 
                       hidden = c(2,2) , threshold = 0.01 , 
                       act.fct = "logistic",
                       linear.output = FALSE
)


modelNN_3 <- neuralnet(Outcome ~ . , data = trainSet , 
                       hidden = c(3,3) , threshold = 0.08 ,
                       rep = 2,
                       act.fct = "logistic",
                       linear.output = FALSE
)

plot(modelNN_3)






