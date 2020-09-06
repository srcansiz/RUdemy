

## Uniform Dağılımı

?dunif

dunif(x = 5 , min = 0 , max = 10)
dunif(x = 4 , min = 0 , max = 10)
dunif(x = 3 , min = 0 , max = 10)
dunif(x = 2 , min = 0 , max = 10)
dunif(x = 1 , min = 0 , max = 10)


plot(1:40 , dunif(1:40 , min = 1 , max = 40))


dunif(x = 5 , min = 0 , max = 10)+
dunif(x = 4 , min = 0 , max = 10)+
dunif(x = 3 , min = 0 , max = 10)+
dunif(x = 2 , min = 0 , max = 10)+
dunif(x = 1 , min = 0 , max = 10)

punif( q = 5 , min = 0 , max = 10 , lower.tail = TRUE )
punif( q = 3 , min = 0 , max = 10 , lower.tail = TRUE )
punif( q = 15 , min = 10 , max = 55 , lower.tail = TRUE )

dunif(x = 14 , min = 0 , max = 10)


qunif(p = 0.5 , min = 0 , max = 10 , lower.tail = FALSE)
qunif(p = 0.8 , min = 0 , max = 20 , lower.tail = FALSE)
qunif(p = 0.8 , min = 0 , max = 20 , lower.tail = TRUE)


runif(n = 50 , min = 0 , max = 20)
d <- runif(n = 50 , min = 0 , max = 20)

d
round(d)


qunif(p = 0.83 , min = 0 , max = 20 , lower.tail = TRUE)
