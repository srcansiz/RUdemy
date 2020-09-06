
#install.packages("nnet")
library(tidyverse)
library(nnet)

modelData <- read.csv('heart.csv')
View(modelData)

modelData <- modelData[ , -which(names(modelData) == "target")]
table(modelData$cp)

modelData <- modelData[modelData$cp != 3 , ]
table(modelData$cp)

modelData <- modelData %>% mutate(
                        cp = as.factor(cp),
                        slope = as.factor(slope),
                        ca = as.factor(ca),
                        thal = as.factor(thal),
                        restecg = as.factor(restecg)
)

table(modelData$restecg)

## Train ve Test Ayrımı 

trainTestSplit <- function(data , dvName , seed){
  
          tbl <- table(data[,dvName])
          classes <- names(tbl)
          minClass <- min(tbl)
          lengthClass <- length(tbl)
          
          train <- data.frame()
          test <- data.frame()
          
          for(i in 1:lengthClass){
              
             selectedClass <- data[,dvName] == classes[i]
             set.seed(seed)
             sampleIndex <- sample(1:nrow(data[selectedClass , ]) , size = minClass*0.8)
             
             train <- rbind(train , data[selectedClass , ][sampleIndex , ])
             test <- rbind(test , data[selectedClass , ][-sampleIndex , ])
          }
          
          return(list(train , test))
  
}

train <- trainTestSplit(modelData , "cp" , 125)[[1]]
test <- trainTestSplit(modelData , "cp" , 125)[[2]]

table(train$cp)
table(test$cp)


plot(train$age , train$cp , pch = 19 , bty = "L")
plot(train$trestbps , train$cp , pch = 19 , bty = "L")
plot(train$chol , train$cp , pch = 19 , bty = "L")
plot(train$thalach , train$cp , pch = 19 , bty = "L")
plot(train$oldpeak , train$cp , pch = 19 , bty = "L")

plot(as.factor(train$sex) , train$cp)
plot(as.factor(train$slope) , train$cp)

table(train$sex , train$cp)
table(train$cp)
table(train$sex)
levels(train$cp)

par(mfrow=c(2,2))
plot(train$cp , train$age , main = "Age" )
plot(train$cp , train$thalach , main = "Thalach")
plot(train$cp , train$trestbps)
plot(train$cp , train$age)





