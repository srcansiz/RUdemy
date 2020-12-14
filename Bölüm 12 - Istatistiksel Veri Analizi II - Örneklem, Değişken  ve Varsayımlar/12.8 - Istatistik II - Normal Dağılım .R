
## Normal Dağılım 

?dnorm


dnorm( x = 20 , mean = 30 , sd = 5)
dnorm( x = 25 , mean = 30 , sd = 5)
dnorm( x = 30 , mean = 30 , sd = 5)
dnorm( x = 35 , mean = 30 , sd = 5)


plot( 1:60 , dnorm( x = 1:60 , mean = 30 , sd = 5 ) , 
      bty = "L",
      pch = 19
      )
lines(dnorm( x = 1:60 , mean = 30 , sd = 10 ) , lwd = 2 , col = "orange")

###
###

## Bir sınıftaki erkeklerin boylarının ortalaması 180 cm
## ve standart sapma değeri 10cm 

## 160cm'den daha fazla olma olasılığı

pnorm( q = 160 , mean = 180 , sd = 10 , lower.tail = FALSE )

## 160'dan daha az olması 
pnorm( q = 160 , mean = 180 , sd = 10 , lower.tail = TRUE )

## 170'den daha az olmasının olasılığı
pnorm( q = 170 , mean = 180 , sd = 10 , lower.tail = TRUE )

pnorm( q = 180 , mean = 180 , sd = 10 , lower.tail = FALSE )
pnorm( q = 180 , mean = 180 , sd = 10 , lower.tail = TRUE )


qnorm( p = 0.70 , mean = 180 , sd = 10 , lower.tail = FALSE)
qnorm( p = 0.80 , mean = 180 , sd = 10 , lower.tail = FALSE)
qnorm( p = 0.80 , mean = 180 , sd = 10 , lower.tail = TRUE)


qnorm( p = 0.90 , mean = 180 , sd = 10 , lower.tail = TRUE)
qnorm( p = 0.90 , mean = 180 , sd = 10 , lower.tail = FALSE)


rnorm(n = 50 , mean = 40 , sd = 10)
r <- rnorm(n = 50 , mean = 40 , sd = 10)

mean(r)
sd(r)
hist(r)



