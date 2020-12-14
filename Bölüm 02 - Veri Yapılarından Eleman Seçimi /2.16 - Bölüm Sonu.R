
x <- c(1,2,3,4)
l <- list(1,2,3 , c(11,22,33))
m <- matrix(c(1,2,3,4,5,6,7,8,9,10,11,12) , 3, 4)
df <- data.frame('A' = c(1,2,3,4) , 
                 'B' = c('A' , 'B' , 'C' , 'D'),
                 'C' = c(11,22,33,44))

# Vektor Eleman Seçimi
x[1] 

# VEktor Eleman Çıkartma 
x[-1]

# VEktor Eleman Ekleme
x[5] <- 14

#List eleman seçimi
l[1]
l[[1]]
l[[4]][1]

# Liste eleman çıkartma
l[1] <- NULL
l[[2]] <- NULL

# Liste Eleman Ekleme
l[3] <- 5
l[[4]] <- 5

# Matris eleman Seçimi
m[1,2]

# Matris eleman çıkartma
m[,-2]
m[-1,]

# Matrislerde eleman eklem
cbind(m, c(1,2,3))
rbind(m , c(1,2,3,4))

# Kaydetmek için tekrar atama
m <- cbind(m, c(1,2,3))
m <- rbind(m , c(1,2,3,4 ,5))

# Data Frame Eleman Seçimi
df[1,1]
df[2,1]

# Data Frame Satır Sütun Çıkartma Çıkartma
df[-1]
df[,-1] # Eğer iki sütun varsa virgüllü çıkartma yapılmaz

df[1] <- NULL
df[,1] <- NULL

df <- data.frame('A' = c(1,2,3,4) , 
                 'B' = c('A' , 'B' , 'C' , 'D'),
                 'C' = c(11,22,33,44))

df[-1, ]
df[-2, ]

df <- df[-2, ] # Kaydetmek için tekrar atama yapılması gerek

# Değer değiştirme

df[1,1] 
df[1,1] <- 144
df

df[4] <- c(1,2,3) 
cbind(df , 'F' =c(1,2,3))
cbind(df , data.frame('A1' = c(1,2,3)))
rbind(df , data.frame('A' = c(1) , 'B' = c('D') , 'C' = c(12) , 'V4' = c(2) ))
