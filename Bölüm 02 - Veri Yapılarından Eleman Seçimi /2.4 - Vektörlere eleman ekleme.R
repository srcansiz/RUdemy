
x <- c(11,22,33,44)

# 5ç elemanı ekleme 
x[5] <- 55


# Bırden fazla eleman ekele
x[5:10] <- 3


# 11. eleman NA olur
x[12] <- 5

x[11] <- 1
x

x[c(13,14)] <- c(11,12)
x
