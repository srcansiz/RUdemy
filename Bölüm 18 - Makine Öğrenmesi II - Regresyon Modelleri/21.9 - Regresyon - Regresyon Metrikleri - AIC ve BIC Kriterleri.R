
### Regresyon Metrikleri 

## Mean Squared Error 

model <- lm(Ozone ~ Temp , data = airquality , na.action = na.omit)

mse <- sum(model$residuals**2) / length(model$residuals)
mse


## AIC ve BIC Kreterleri #################################################

## AIC = n * log(RSS/n) + 2 * num_params 
## AIC = -2 * (log-likelihood) + k * N_par # R bu fonksiyonu kullanıyor
## AIC = 2k + n * (log(2 * pi * RSS/n ) + 1)  # Bu fonksiyonda R ile aynı sonucu veriyor. 


## BIC = -2 * (log-likelihood) + k *log(n) # R BIC fonksiyonu bu formülü kullanıyor
## BIC = n * log(RSS/n) + k * log(n)

# k = modeldeki parameter sayısı Bo dahil olarak
# Ayırca AIC formulünde varyans ayrı bir parametre olarak sayılmaktadır. 
# Bu nedenle toplam parametre sayısı = k + 1 ; bir diğer parametre varyans olarak alınmalıdır. 

loglik <- logLik(model)
loglik <- as.numeric(loglik)
k = 3 
N_par = 3

AIC <- -2 * (loglik) + k * N_par
AIC

AIC(model , k = 3)
BIC(model)

air <- airquality[c("Ozone" , "Temp")]
air <- na.omit(air)
dist <- mahalanobis(air , center = colMeans(air) , cov = cov(air))
cutoff <- qchisq(p = 0.95 , df = 2)
ids <- which(dist > cutoff)
air <- air[-ids , ]


modelRemovedOut <-  lm(Ozone ~ Temp , data = air)

AIC(model , k = 3)
BIC(model)

AIC(modelRemovedOut , k = 3)
BIC(modelRemovedOut )
