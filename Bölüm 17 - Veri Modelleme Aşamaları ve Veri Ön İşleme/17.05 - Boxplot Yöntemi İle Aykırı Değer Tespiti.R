library(rstatix)

?identify_outliers


out <- identify_outliers(AirbnbNewyork["price"])
names(out)

min(out$price)
max(out$price)

min(AirbnbNewyork[,"price"])
max(AirbnbNewyork[,"price"])

ids <- which(out$is.extreme == TRUE)
extreme <- out[ids, "price"]

min(extreme)
max(extreme)

length(extreme)
nrow(out)
nrow(AirbnbNewyork)
