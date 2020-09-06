

# Binom Dağılımı 

?dbinom

# Bir olayda başarılı olma olasılığı 0.7  başarısızlık = 1 - 0.7 = 0.3

dbinom(x = 5 , size = 10 , prob = 0.7 )
dbinom(x = 7 , size = 10 , prob = 0.7 )
dbinom(x = 9 , size = 10 , prob = 0.7 )


plot( x = 1:30 , y = dbinom(x = 1:30 , size = 30 , prob = 0.7 ) , 
      bty = "L",
      pch = 19
      )
lines( dbinom(x = 1:30 , size = 30 , prob = 0.5 ) )
lines( dbinom(x = 1:30 , size = 30 , prob = 0.3 ) )


####

pbinom( q = 5 , size = 30 , prob = 0.7 , lower.tail = TRUE)
pbinom( q = 16 , size = 30 , prob = 0.7 , lower.tail = TRUE)
pbinom( q = 16 , size = 30 , prob = 0.7 , lower.tail = FALSE)


pbinom( q = 10 , size = 30 , prob = 0.7 , lower.tail = TRUE)


dbinom(x = 10 , size = 30 , prob = 0.7 ) +
dbinom(x = 9 , size = 30 , prob = 0.7 )+
dbinom(x = 8 , size = 30 , prob = 0.7 )+
dbinom(x = 7 , size = 30 , prob = 0.7 )+
dbinom(x = 6 , size = 30 , prob = 0.7 )+
dbinom(x = 5 , size = 30 , prob = 0.7 )+
dbinom(x = 4 , size = 30 , prob = 0.7 )+
dbinom(x = 3 , size = 30 , prob = 0.7 )+
dbinom(x = 2 , size = 30 , prob = 0.7 )+
dbinom(x = 1 , size = 30 , prob = 0.7 )+
dbinom(x = 0 , size = 30 , prob = 0.7 )


### 

# Örnek : 
# Bir e-ticaret sitesine gelen ortalama 4 müşteriden 1'i alış 
# veriş yapıyor. Bu e-ticaret sitesine bir gün için 30 müşteri girmesi
# bekleniyor en az 10 alış veriş yapılma olasılığı nedir?  

m <- 1/4

pbinom(q = 9 , size = 30 , prob =  1/4 , lower.tail = FALSE)



# Olasılık değerine göre kaç kare başarılı olacağımızı elde ederiz

qbinom(p = 0.7 , size = 30 , prob = 1/4 , lower.tail = FALSE)
qbinom(p = 0.7 , size = 30 , prob = 1/4 , lower.tail = TRUE)



# Rastgele Binom Dağılan Veriler 

rbinom(n = 50 , size = 30 , prob = 1/4)
d <- rbinom(n = 50 , size = 30 , prob = 1/4)
d <- rbinom(n = 50 , size = 30 , prob = 1/4)
hist(d)

d <- rbinom(n = 50 , size = 30 , prob = 1/2)
hist(d)




