

#### Veri Ön İşleme - Standartlaştırma #####

# install.packages("glmnet")
library(caret)
library(glmnet)
library(tidyverse)

loan <- Bank_Loan_Data
names(loan)

modelData <- loan %>% 
                    mutate( purpose_cat = as.factor(purpose_cat)) %>%
                    select(loan_amount , term , income_category , 
                             purpose_cat , grade , interest_payments , 
                             loan_condition , annual_inc , emp_length_int)

class(modelData$purpose_cat)
View(modelData)

num_cols <- c("annual_inc" , "emp_length_int")

## Standartlaştırma İşlemi 
pre_scaled <- preProcess(modelData[, num_cols] , method = c("center" , "scale"))
modelDataScaled <- predict(pre_scaled , modelData)

## Standartlaştırılmış veri seti
View(modelDataScaled)

## One Hot Encoding Dummy Değişken

modelDataScaled1 <- model.matrix(loan_amount ~ . , data  = modelDataScaled)
head(modelDataScaled1)


set.seed(145)
sampleTrainIndex <- sample(1:nrow(modelDataScaled1)  , size = 0.8*nrow(modelDataScaled1))

trainSet <- modelDataScaled1[sampleTrainIndex,]
testSet <- modelDataScaled1[-sampleTrainIndex,]


### Ridge REgresyon Modeli 

modelRidge1 <- glmnet(trainSet_x , trainSet_y , alpha = 0 , lambda = 0.05 )
summary(modelRidge1)

modelRidge1$beta
modelRidge1$a0
modelRidge1$lambda
modelRidge1$dev.ratio


### Lambda Değeri İçin Cross Validation 

?cv.glmnet


lambdas = 10^seq(3 , -2 , by = -.01)
lambdas  
  
modelRidgeCV <- cv.glmnet(trainSet_x , trainSet_y , alpha = 0 , 
                          lambda = lambdas , nfolds = 10)
modelRidgeCV$cvm

plot(modelRidgeCV)

# İdeal Lambda Değeri
modelRidgeCV$lambda.min
modelRidgeCV$nzero

modelRidgeCV
