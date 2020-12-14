
m <- matrix(c(1,2,3,4) , 2,2,T)
m

# Yanlış kullanım
m[ , 3] <- c(1,2) 

# Doğru kullanım

cbind(m , c(1,2))
rbind(m , c(1,2))

cbind(m , c(1,2 ,3))
rbind(m , c(1,2 , 3))

m <- cbind(m , c(1,2))
m <- rbind(m , c(1,2 , 3 , 5))
m
