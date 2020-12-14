

## Üstel Exponential Dağılım

## Bir otobüs durağına 10 dakikada bir otobüs gelmektedir. Bu durumda; 
## Poisson Problemi : Bir dakika sonra otobüs gelmeme olasılığı nedir? 
## Üstel   Problemi : Otobüsün gelmesinin bir dakikadan daha uzun süremesi 
##                    olasılığı nedir? 

## Lambda bir dakika için 1/10'a eşit olacaktır. 

?dexp

dpois(x = 0 , lambda = 1/10)
pexp( q = 1 , rate = 1/10 , lower.tail = FALSE)


dexp(x = 2 , rate = 1/10)
dexp(x = 3 , rate = 1/10)
dexp(x = 4 , rate = 1/10)

plot(1:30 , dexp(1:30 , rate = 1/15) , bty = "L" , pch = 19)
lines(dexp(1:30 , rate = 1/10)  , col = "orange")
lines(dexp(1:30 , rate = 1/5)  , col = "blue")

pexp(5  , rate = 1/20 , lower.tail = FALSE)
pexp(5  , rate = 1/20 , lower.tail = TRUE)


qexp( p = 0.7 , rate = 1/20 , lower.tail = FALSE)
qexp( p = 0.2 , rate = 1/20 , lower.tail = TRUE)
qexp( p = 0.9 , rate = 1/20 , lower.tail = TRUE)


rexp(n = 50 , rate = 1/20)



####






dpois(x = 0 , lambda = 1/10)

pexp( q = 1 , rate  = 1/10, lower.tail = FALSE)



dexp( x = 3 , rate = 1/10)


plot(1:40 , dexp(x = 1:40 , rate = 1/10))
lines(dexp(x = 1:40 , rate = 1/20))
