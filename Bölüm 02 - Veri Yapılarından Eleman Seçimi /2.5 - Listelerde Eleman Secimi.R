
list(1,2,3,4)
list(c(1,2,3) , 'A' , 10)

x <- list(11,12 , c('A' , 'B' , 'C') )

x[1]
x[[1]]

class(x[1])
class(x[[1]])

x[3][2] # Null değerini verir

x[[3]][2] # Doğru kullanım


y <- list('A' = c(1,2,3,4) , 'B' = c(11,22,33,44))
names(y)
y
y['A']
class(y['A'])

y[['A']]
class(y[['A']])


y$B
y$A

class(y$B)
class(y$A)

