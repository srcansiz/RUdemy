
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

