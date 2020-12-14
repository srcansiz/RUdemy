

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



