

# 1- Kayıp gözlem tespiti 
# 2- Dağılım Kontrolü 
# 3- Aykırı değerlerin değerlendirilmesi
# 4- Veri analizine hazır verinin oluşturulması

airbnb <- AirbnbNewyork

prices <- airbnb$price
reviews <- airbnb$reviews_per_month

## Müsaitlik durumu 0 olanların çıkartılması 
zeroVal <- which(airbnb$availability_365 == 0)
zeroVal
length(zeroVal)


# Yeni prices 
prices <- prices[-zeroVal]
reviews <- reviews[-zeroVal]
length(prices);length(reviews)


# NA değerlerini çıkartma işlemi
table(is.na(prices))
table(is.na(reviews))

nas <- which(is.na(reviews))
length(nas)
reviews <- reviews[-nas]
prices <- prices[-nas]
length(prices);length(reviews)

# Aykırı değer kontrolü
hist(prices)
hist(reviews)

quantile(prices , probs = c(0.0 , 0.25 , 0.50 , 0.75 , 1))
quantile(prices , probs = c(0.75 , 0.80 , 0.85 , 0.90 , 0.95))

greater365 <- which(prices > 365)
length(greater365)
prices <- prices[-greater365]
reviews <- reviews[-greater365]
length(prices);length(reviews)

quantile(reviews , probs = c(0.0 , 0.25 , 0.50 , 0.75 , 1))
quantile(reviews , probs = c(0.75 , 0.80 , 0.85 , 0.90 , 0.95 , 0.99))

greater7.8 <- which(reviews > 7.8)
length(greater7.8)
prices <- prices[-greater7.8]
reviews <- reviews[-greater7.8]
length(prices);length(reviews)

# Gruplama İşlemi 

hist(reviews)

length(reviews[reviews > 1.5])
length(reviews[reviews <= 1.5])

group <- character(length = length(reviews))

group[which(reviews <= 1.5)] <- "Düşük"
group[which(reviews > 1.5)] <- "Yüksek"

df <- data.frame( "prices" = prices , "groups" = group)
View(df)
