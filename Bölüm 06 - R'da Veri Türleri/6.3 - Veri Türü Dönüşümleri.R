
x <- c(12,13,14,15,16)
class(x)

class(as.integer(x))
xI <- as.integer(x)
class(xI)

class(x)
x <- as.integer(x)
class(x)

x <- as.numeric(x)
class(x)

y <- c('A' , 'B' , 'C' , 'D')
class(y)

y <- as.factor(y)
class(y)

y <- as.character(y)
class(y)

class(x) 
xN <- x
xN

xC <- as.character(xN)
xC
class(xC)

x <- c(0,0,1,1,0)
class(x)
xL <- as.logical(x)
class(xL)

x1 <- c(11,23,45,56)
x1L <- as.logical(x1)
x1L

x2 <- c(11,23,45,0)
x2L <- as.logical(x2)
x2L

y1 <- c('A' , 'B' , 'C')
y1L <- as.logical(y1)
y1L
