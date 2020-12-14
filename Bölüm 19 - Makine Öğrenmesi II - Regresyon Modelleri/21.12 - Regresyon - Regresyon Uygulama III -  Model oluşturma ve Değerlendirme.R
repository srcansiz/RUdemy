
### Regresyon Uygulama 1 - Train ve Test Ayırma 

model_data <- kc_house_data[c("price" ,"sqft_living")]

View(model_data)

# random sample 

set.seed(145)
sampleIndex <- sample(1:nrow(model_data) , size = 0.8*nrow(model_data))

trainSet <- model_data[sampleIndex , ]
testSet <- model_data[-sampleIndex , ]

nrow(trainSet)
nrow(testSet)


### Train Veri Seti Incelemeleri ve Aykırı Değer Kontrolü 

cor(trainSet)

hist(trainSet$price)
hist(trainSet$sqft_living)


library(ggplot2)

fig  <- ggplot(data  = trainSet , aes(x = sqft_living , y =  price)) +
  geom_point(size = 2) + 
  ylab("Fiyatlar") + xlab("Salon Büyüklüğü")
fig        

library(outliers)

scores <- scores(trainSet , type = "z" , prob = 0.95)

anyTrue <- apply(scores , 1 , FUN = function(x) { any(x) }  )

index <- which(anyTrue)

trainSetRemovedOut <- trainSet[-index , ]

nrow(trainSet)
nrow(trainSetRemovedOut)

fig2  <- ggplot(data  = trainSetRemovedOut , aes(x = sqft_living , y =  price)) +
  geom_point(size = 2) + 
  ylab("Fiyatlar") + xlab("Salon Büyüklüğü")
fig2

cor(trainSetRemovedOut)

# Kayıp gözlem kontrolü
library(mice)
md.pattern(trainSet)


### Model Oluşturma ve Değerlendirme


model1 <- lm(price ~ sqft_living , data  = trainSet)
model2 <- lm(price ~ sqft_living , data  = trainSetRemovedOut)


summary(model1)
summary(model2)

AIC(model1)
BIC(model1)
AIC(model2)
BIC(model2)

