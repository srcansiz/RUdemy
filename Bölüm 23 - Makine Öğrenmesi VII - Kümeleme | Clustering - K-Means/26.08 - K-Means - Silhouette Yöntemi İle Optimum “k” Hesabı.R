
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

library(tidyverse)


reversedData <- modelData %>% select(one_of(scaleModel$mean %>% names)) %>%
                    map2_df(scaleModel$std , function(sd , var){var * sd}) %>%
                    map2_df(scaleModel$mean , function(mu , var){var + mu})
View(reversedData)


reversedData$cluster <- clusterModel$cluster

reversedData %>% group_by(cluster) %>% summarise_all(mean)


# FRESH: Taze üzerünlerdeki yıllık harcama 
# MILK: Yıllık süt harcaması
# GROCERY: Market ürünleri yıllık harcama
# FROZEN: donmuş ürünler yıllık harcama 
# DETERGENTS_PAPER: deterjan ve kağıt yıllık harcama 
# DELICATESSEN: Soğuk Meze ürünleri yıllık harcama
# CHANNEL: (Hotel/Restaurant/Cafe) or Retail channel (Nominal)
# REGION: Müşteri bölgesi Lisnon, Oporto or Other (Nominal)



boxplot(Fresh ~ cluster , data  = reversedData)
boxplot(Milk ~ cluster , data  = reversedData)

fviz_cluster(clusterModel , data  = modelData )


clusterModel$withinss
clusterModel$tot.withinss

## Elbow Optimum K 

wss <- sapply(2:10 , FUN = function(x){kmeans(modelData , 
                                       centers = x , nstart = 10 , 
                                       iter.max = 15)$tot.withinss
                                })
wss


plot(2:10 , wss , type = "b")
fviz_nbclust(modelData , kmeans , method = "wss")

### Silhouette Optimum K 

silhouette(clusterModel$cluster , dist(modelData))


silScore <- function(x){
          model <- kmeans(modelData , centers = x , nstart = 10 , iter.max = 15)
          sil <- silhouette(model$cluster , dist(modelData))[,3]
          score <- mean(sil)
          return(score)
}

scores <- sapply(2:10 , FUN = silScore)

plot(2:10 , scores , type = "b")
fviz_nbclust(modelData , kmeans , method = "silhouette")

?fviz_nbclust


### Optimum K İle Model Oluşturma





