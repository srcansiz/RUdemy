library(ggplot2)
library(car)

View(airquality)

fig <- ggplot(airquality , aes(x = Ozone , y  = Temp)) + 
          geom_point(size = 2) + 
          xlab("Ozone Değerleri") + ylab("Temp Değerleri")

fig


X <- na.omit(airquality[c("Ozone" , "Temp")])
View(X)

air.center <- colMeans(X)
air.center
air.cov <- cov(X)
air.cov  
rad <- sqrt(qchisq(0.80 , df = 2 ))
rad

ellipse <- ellipse(center = air.center , shape = air.cov , rad = rad , 
        segments = 100 , draw = FALSE)
ellipse
ellipse <- as.data.frame(ellipse)
colnames(ellipse) <- colnames(X)

fig <- fig + geom_polygon(data = ellipse , color = "orange" , fill = "orange" , 
                   alpha = 0.3) + 
      geom_point(aes(x = air.center[1] , y = air.center[2]) , 
                 size = 5 , color = "blue")

fig

dist <- mahalanobis(X , center = air.center , cov = air.cov)
dist

cutoff <- qchisq(p = 0.95 , df = 2)

ids <- which(dist > cutoff)
names(ids)

X[ids ,]


