

### NN Regression

library(neuralnet)
library(caret)
library(mice)

concrete <- read.csv("Concrete_Data.csv" , header = T , sep = ";" , dec = ",")
View(concrete)

nrow(concrete)

md.pattern(concrete)

scaleModel <- preProcess(concrete , method = c("center" , "scale"))

modelData <- predict(scaleModel , concrete)
View(modelData)

scaleModel$mean
scaleModel$std


# Tran Test Split


set.seed(165)
trainIndex <- sample(1:nrow(modelData) , 0.75*nrow(modelData))

trainSet <- modelData[ trainIndex ,]
testSet <- modelData[ -trainIndex ,]

nrow(trainSet)
nrow(testSet)

modelNN_1 <- neuralnet(strength ~ . , data  = trainSet , 
                       hidden = 4,
                       threshold = 0.04,
                       learningrate = 0.05,
                       linear.output = TRUE
                       )

modelNN_2 <- neuralnet(strength ~ . , data  = trainSet , 
                       hidden = c(3,2),
                       threshold = 0.04,
                       learningrate = 0.05,
                       linear.output = TRUE
)

plot(modelNN_1)
plot(modelNN_2)


modelNN_1
modelNN_1$net.result

## Fitted Values Üzerinden Metrikler 

fittedValues_1 <- modelNN_1$net.result[[1]]

R2(fittedValues_1 , trainSet$strength)
RMSE(fittedValues_1 , trainSet$strength)
MAE(fittedValues_1 , trainSet$strength)

min(trainSet$strength);max( trainSet$strength)


# Model 2  Fitted 

fittedValues_2 <- modelNN_2$net.result[[1]]

R2(fittedValues_2 , trainSet$strength)
RMSE(fittedValues_2 , trainSet$strength)
MAE(fittedValues_2 , trainSet$strength)


## Modeller Üzerinde Test veri seti ile tahminler


predModel_1 <- predict(modelNN_1 , testSet)
predModel_2 <- predict(modelNN_2 , testSet)

R2(predModel_1 , testSet$strength)
RMSE(predModel_1 , testSet$strength)
MAE(predModel_1 , testSet$strength)

R2(predModel_2 , testSet$strength)
RMSE(predModel_2 , testSet$strength)
MAE(predModel_2 , testSet$strength)


# x - mean(x) / standart sapma
scaleModel$std
scaleModel$mean

## Scale İşleminin Tersi
reverseScale <- function(x , model) {
          
          reverse <- (x*model[["std"]]["strength"]) + model[["mean"]]["strength"] 
          
          return(reverse)
}

## Orginal Tahmin Edilen Değerler
reverseScale(predModel_1[,1] , scaleModel )

## Orgjinale dönen veriler üzerinden R2
R2(reverseScale(predModel_1[,1] , scaleModel ), 
   reverseScale(testSet$strength , scaleModel ) )


## Reverse Scale Sağlaması Doğrulaması
reverseScale( modelData$strength , scaleModel )

new_data <- concrete[189 , ]

predData <- predict(scaleModel , new_data)[,-9]

predSingle <- predict(modelNN_1 , predData)

reverseScale(predSingle , scaleModel)

####






#####


### Tüm Değişkenlerin Reverse Scaleden Geçirilmesi

modelData %>% 
            select(one_of(scaleModel$std %>% names)) %>%
            map2_df( scaleModel$std , function(sig, var) var * sig) %>%
            map2_df(scaleModel$mean , function(mu, var) var + mu)
        


