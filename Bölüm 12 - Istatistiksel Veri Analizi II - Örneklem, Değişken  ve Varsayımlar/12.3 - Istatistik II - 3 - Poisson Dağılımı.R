

## Poisson Dağılımı 

?dpois

# 1 saatte 15 tane araba geçiyor

# 1 - bu köprüden 1 saatte 20 araba geçme olaslığı 
dpois(x = 20 , lambda = 15)

# 2 - Bu köprüden 1 saate 5 araba geçme olaslığı 
dpois(x = 5 , lambda = 15 )


plot(1:30 , dpois( x = 1:30 , lambda = 15  ) , 
     bty = "L" , 
     pch = 19,
     col = "orange"
     )
lines(dpois( x = 1:30 , lambda = 20  ) , lwd = 2 , col = "blue" )


# 1 saate 20 araba geçiyor 
# Dakika = 20/60 = 1/3

dpois(x = 2 , lambda = 1/3)
dpois(x = 1 , lambda = 1/3)


#### 

# 1 dakikada araba geçeme olasılığı lambda = 1/3

ppois( q = 2 , lambda = 1/3 , lower.tail = FALSE )
ppois( q = 2 , lambda = 1/3 , lower.tail = TRUE )


####




### Örnek : 
### E-Ticaret sitesi üzerine bir Makine Öğrenmesi algoritması 
### eklendi ve algoritma ile müşterilerin beğenebileceği ürünler 
### tahmin edilerek satış yapma olasılığı tahmin edilmek isteniyor.
### Makine öğrenmesi algoritması eklendikten sonra elde edilen
### verilere göre günün öğlen saatlerinin 1 saatlik zaman diliminde 
### makine öğrenmesi modeli ile ürün tavsiyelerini gören müşterilerden
### 20 tanesi satın alma işlemi yapıyor. Buna göre herhangi başka bir 
### öğlen saatlerinde 1 saatlik zaman diliminde 30'dan fazla satış yapılma olasılığı 
### nedir.

ppois(q = 30 , lambda = 20 , lower.tail = FALSE)
ppois(q = 15 , lambda = 20 , lower.tail = FALSE)

### 



# Olasılık değerine göre x değeri elde etme

qpois( p = 0.6 , lambda = 15 , lower.tail = TRUE)
qpois( p = 0.2 , lambda = 15 , lower.tail = TRUE)
qpois( p = 0.9 , lambda = 15 , lower.tail = FALSE)
qpois( p = 0.2 , lambda = 15 , lower.tail = FALSE)





###


# Rastgele Veri Üretimi 

rpois(n = 50 , lambda = 25)
rpois(n = 50 , lambda = 15)
rpois(n = 50 , lambda = 1/4)



