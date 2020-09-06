
x <- c(12,34,56,23,34,12,35)

median(x)
mean(x)


# Açıklık
max(x) - min(x)
range(x)
r <- range(x)
r[2] - r[1]

# Çeyreklikler 

quantile(x)

quantile(x , probs = c(0.25 , 0.5 , 0.75)) 
quantile(x , probs = c(0.10 , 0.60 , 0.95)) 



