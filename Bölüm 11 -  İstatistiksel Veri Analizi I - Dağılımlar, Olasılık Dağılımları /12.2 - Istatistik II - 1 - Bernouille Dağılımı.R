

## Bernoulli Dağılımı 

install.packages("Rlab")
library(Rlab)

?dbern

# Başarılı olunma olasılığı 0.6 
dbern(x = 0 , prob = 0.6)


# Başarılı olunma olasılığı 0.7
dbern(x = 0 , prob = 0.7)
dbern(x = 1 , prob = 0.7)
dbern(x = 2 , prob = 0.7)

# Bir torbadan siyah top alma olasılığım 0.4 
dbern(x = 0 , prob = 0.4)


pbern(q = 1 , prob = 0.7  , lower.tail = TRUE)
 
# 0 , 1 

dbern(x = 0 , prob = 0.7)+
dbern(x = 1 , prob = 0.7)



pbern(q = 1 , prob = 0.7  , lower.tail = FALSE)
pbern(q = 0 , prob = 0.7  , lower.tail = FALSE)

# 0'dan büyük tek değer 1 
dbern(x = 1 , prob = 0.7)

qbern( p = 0.5 , prob = 0.7 , lower.tail = TRUE)
qbern( p = 0.2 , prob = 0.7 , lower.tail = TRUE)
qbern( p = 0.6 , prob = 0.7 , lower.tail = FALSE)


rbern(n = 50 , prob = 0.7)
r <- rbern(n = 50 , prob = 0.7)
r
table(r)


r2 <- rbern(n = 50 , prob = 0.3)
r2
table(r2)






