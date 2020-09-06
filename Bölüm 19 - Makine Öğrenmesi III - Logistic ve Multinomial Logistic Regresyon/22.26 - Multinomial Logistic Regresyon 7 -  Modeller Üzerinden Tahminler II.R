
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


### Keşfecidici Veri Analizi

par(mfrow= c(2,2))
plot(train$cp , train$age , main = "Age")
plot(train$cp , train$trestbps , main = "trestbps")
plot(train$cp , train$chol , main = "Chol")
plot(train$cp , train$thalach , main = "Thalach")

dev.off()
plot(train$cp , train$oldpeak , main = "Oldpeak")


table(train$cp , train$sex)
## Cinsiyet
chisq.test(table(train$cp , train$sex))

## Exang
chisq.test(table(train$cp , train$exang))

## Slope
chisq.test(table(train$cp , train$slope))
table(train$cp , train$slope)


# Ca 
chisq.test(table(train$cp , train$ca))

# Fbs
chisq.test(table(train$cp , train$fbs))

# Thal
chisq.test(table(train$cp , train$thal))

# RestECG
chisq.test(table(train$cp , train$restecg))


# Multinomial Model Oluşturma 

#install.packages("nnet")
library(e1071)
library(tidyverse)
library(nnet)
library(caret)


modelBase <- multinom(cp ~ . , data = train)
summary(modelBase)
modelBase$fitted.values
modelBase$decay


### Farklı Model Karşılaştırmaları

model2 <- multinom(cp ~ sex + fbs + restecg + thalach + exang + oldpeak + slope + ca + thal 
                   , data = train)
# Model 2
summary(model2)

# Model Base
summary(modelBase)


model3 <- multinom(cp ~  thalach + exang + oldpeak + slope + ca + thal 
                   , data = train)
# Model 2
summary(model3)

# Model Base
summary(modelBase)


#### Modeller Üzerinden Tahminler 

library(caret)
caret::varImp(modelBase)

predModelBase <- predict(modelBase , test)
predModelBase

predModel2 <- predict(model2 , test)
predModel2


predModel3 <- predict(model3 , test)
predModel3

caret::confusionMatrix(predModelBase , test$cp , mode = "prec_recall")
caret::confusionMatrix(predModel2 , test$cp , mode = "prec_recall")
caret::confusionMatrix(predModel3 , test$cp , mode = "prec_recall")

### Oran Eşitlemeleri 


View(test)


table(test$cp)

testOranlarEsit <- data.frame()

class(test$cp)

test[test$cp == "0" , ]

sampleIndex_0 <- sample(1:nrow(test[test$cp == "0" , ]) , size = 10)
sampleIndex_2 <- sample(1:nrow(test[test$cp == "2" , ]) , size = 10)

testOranlarEsit <- rbind(testOranlarEsit , test[test$cp == "0" , ][sampleIndex_0 ,])
testOranlarEsit <- rbind(testOranlarEsit , test[test$cp == "2" , ][sampleIndex_2 ,])
testOranlarEsit <- rbind(testOranlarEsit , test[test$cp == "1" ,])
View(testOranlarEsit)


table(testOranlarEsit$cp)


#library(caret)
predModelBaseOR <- predict(modelBase , testOranlarEsit)
predModelBaseOR

predModel2OR <- predict(model2 , testOranlarEsit)
predModel2OR


predModel3OR <- predict(model3 , testOranlarEsit)
predModel3OR

caret::confusionMatrix(predModelBaseOR , testOranlarEsit$cp , mode = "prec_recall")
caret::confusionMatrix(predModel2OR , testOranlarEsit$cp , mode = "prec_recall")
caret::confusionMatrix(predModel3OR , testOranlarEsit$cp , mode = "prec_recall")
