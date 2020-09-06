
x <- c(12,34,12,4,5,45,22,67,34)


sort(x)
sort(x , decreasing = T)


y <- c('Osman' , 'Ahmet' , 'Mehmet' , 'Berk')

y
sort(y)
sort(y , decreasing = T)

na <- c(12,34,12,4,5,45,22,67,34 , NA, NA)
sort(na)

sort(na , decreasing = T , na.last = NA)
sort(na , decreasing = T , na.last = T)
sort(na , decreasing = T , na.last = F)

sıralama <- sort(na , decreasing = T , na.last = T , index.return = T)

class(sıralama)

sıralama[['x']]
sıralama[['ix']]


sıralama[['x']]
sıralama[['ix']][1]
