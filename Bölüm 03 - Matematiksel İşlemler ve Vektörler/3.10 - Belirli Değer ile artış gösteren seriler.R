
seq(10)
seq(1,10)
seq(from = 1 , to = 10)

?seq

seq(from=2 , to = 20 , by = 3)
seq(from=1 , to = 20 , by = 2)

y <- seq(from= 0.30 , to = 10.79 , by = 0.001 )
l <- length(y)

y[10491]
y[l]

t <- seq(from = 1 , to = 10 , length.out = 30)
length(t)


seq(from = 1 , to = 10 , by = 20 )
seq(from = 1 , to = 20 , by = 4 , length.out = 3) # Hatalı
seq(from = 1 , to = 20 , by = 4 , length.out = 20) # Hatalı

seq(from = 1 , to = 20 , by = 4 , length.out = NULL) # Hatalı
seq(from = 1 , to = 20 , by = 4 ) # Doğru kullanım

