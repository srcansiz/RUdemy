
x <- c(10,11,21,32,43,56)

# Tekil eleman değitirme
x[2] <- 33
x

# Birden fazla elemanı tek bir değer ile değiştirme
# 10 33 21 32 43 56 
x[c(1,2)] <- 1 
x

# Birden fazla eleman değiştrime 
x[c(1,2)] <- c(10,11)
x[c(1,2)] <- c(1,2,3)

x[1:3] <- 11:13
x
