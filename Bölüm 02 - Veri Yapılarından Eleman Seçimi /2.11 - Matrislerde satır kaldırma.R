
m <- matrix(c(1,2,3,4) , nrow=2 , ncol=2 , byrow=T)
m

class(m[,-2])
class(m)

m <- m[,-2]
as.matrix(m)

m1 <- matrix(c(11,22,33,44,55,66,77,88) , 4, 2 , T)
m1

# TEk bir satrı çıkartma 
m1[-3 , ]

# Çoklu satır çıkartma işlemleri
m1[-c(2,3) , ]
m1[-c(2:3) , ]
m1[-c(2:4) , ]

# Değerleri NA'ya çevirme
m1[2,2] <- NA
m1
m1[c(1,2) , 1] <- NA
m1

m1[2,2] <- 123
m1

m2 <- m1[-4,]
m2
