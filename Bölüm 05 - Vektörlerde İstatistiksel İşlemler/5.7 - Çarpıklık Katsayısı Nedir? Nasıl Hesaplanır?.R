

x <- c(12,13,14,15,16, 100,120)
x
mean(x)
median(x)


y <- c(12,15,17,18,20,24,26)
mean(y)
median(y)

hist(x)


install.packages('e1071')
library(e1071)

skewness(x)

z <- c(1,2,3 , 60,70,60,70,80,70)
hist(z)
skewness(z)


