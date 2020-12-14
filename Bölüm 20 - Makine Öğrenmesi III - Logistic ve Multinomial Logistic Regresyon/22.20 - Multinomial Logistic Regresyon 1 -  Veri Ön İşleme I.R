
install.packages("nnet")
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


