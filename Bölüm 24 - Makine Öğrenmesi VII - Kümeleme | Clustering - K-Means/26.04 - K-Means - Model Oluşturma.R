
### K-Means Algoritması 

install.packages("cluster")
install.packages("factoextra")
library(cluster)
library(factoextra)
library(caret)

wholesale <- read.csv("wholesale_customers_data.csv")
View(wholesale)


scaleModel<- preProcess(wholesale , method=c("center" , "scale"))


modelData <- predict(scaleModel , wholesale)
View(modelData)

library(mice)
md.pattern(modelData)


# Model Oluşturma 


clusterModel <- kmeans(modelData , centers = 4 , iter.max = 15 , nstart = 15 )
clusterModel

fittedCluster <- fitted(clusterModel)
View(fittedCluster)


clusterModel$cluster

## Küme İncelemeleri


