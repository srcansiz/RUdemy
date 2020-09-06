
x <- c(3,4,2,6,7)

sort(x , decreasing = T)

d <- seq(from = as.Date('2012-01-01'), 
         to = as.Date('2012-01-30') , 
         by = 'day')
d

dr <- sample(d)

sort(dr , decreasing = T)
sort(dr , decreasing = F)
