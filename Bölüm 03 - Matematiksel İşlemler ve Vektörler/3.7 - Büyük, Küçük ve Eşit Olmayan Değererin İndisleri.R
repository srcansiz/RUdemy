
x <- c(23,34,35,37,12,1,90,145,32,14,16)


x > 23
x < 23
x != 23

which(x > 23)
which(x > 60)
which(x < 60)

x[x < 60]
x[which(x<60)]

which( x >= 60)
which( x >= 90)
which( x > 90)

f <- which(x < 24)
f
x[f]
