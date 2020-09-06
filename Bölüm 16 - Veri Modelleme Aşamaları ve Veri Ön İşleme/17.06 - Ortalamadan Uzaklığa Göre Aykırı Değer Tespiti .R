install.packages("outliers")
library(outliers)

View(airquality)

?outlier
outlier(airquality$Ozone)
hist(airquality$Ozone)


outlier(airquality$Ozone , opposite = TRUE)


outlier(airquality$Temp)
outlier(airquality$Temp , opposite = TRUE)
hist(airquality$Temp)

library(rstatix)
identify_outliers(airquality["Temp"])


which(outlier(airquality$Temp , opposite = TRUE , logical = TRUE) == TRUE)
airquality$Temp[120]


out <- outlier(AirbnbNewyork$price , logical = TRUE)

ids <- which(out == TRUE)
AirbnbNewyork$price[ids]


