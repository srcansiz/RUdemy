

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


# Fonksiyonlar  : Normallik ve Test Fonksiyonları 
# Normallik İçin Parametreler: 
# 1 - Veri Seti 
# 2 - Alınacak örneklemin büyüklüğü
# 3 - İterasyon Sayısı 
# 4 - Güven düzeyi 

# Test Fonksiyonu için parametreler 
# 1 - Veri Seti 
# 2 - Parametrik - Non Parametrik Seçeneği
# 3 - Alternatif hipotez 
# 4 - Test edilecek fark değeri 
# 3 - Güven Düzeyi

normallik <- function(data , n , iter , cl){
          
          # Gruplara göre prices (ev ücretleri)
          prices_dusuk <- data[ ,"prices"][data[,"groups"] == "Düşük"]
          prices_yuksek <- data[ ,"prices"][data[,"groups"] == "Yüksek"]
          
          # Kriter p value 
          kr <- 1-cl
          
          
          hipotezYuksek <- character(iter)
          hipotezDusuk <- character(iter)
          
          for(i in 1:iter){
            sample_dusuk <- sample(prices_dusuk , size = n)
            sample_yuksek <- sample(prices_yuksek , size = n)
            
            yuksek <- shapiro.test(sample_yuksek)
            dusuk <- shapiro.test(sample_dusuk)
            
            if(yuksek$p.value > kr){
              hipotezYuksek[i] <- "KABUL" 
            }else{
              hipotezYuksek[i] <- "RED"
            }
            
            if(dusuk$p.value > kr){
              hipotezDusuk[i] <- "KABUL"
            }else{
              hipotezDusuk[i] <- "RED"
            }
          }
          
          tab_yuksek <- table(hipotezYuksek)
          tab_dusuk <- table(hipotezDusuk)
          
          return(list(tab_yuksek , tab_dusuk))
          
}


normallik(data = df , n = 20 , iter = 1000 , cl = 0.95)


testSample <- function(data , n , iter , parametric = TRUE , 
                       alternative , mu , cl){
  
            # Gruplara göre prices (ev ücretleri)
            prices_dusuk <- data[ ,"prices"][data[,"groups"] == "Düşük"]
            prices_yuksek <- data[ ,"prices"][data[,"groups"] == "Yüksek"]
            
            # Kriter p value 
            kr <- 1-cl
            
            
            hipotezSonuc <- character(iter)
            
            for(i in 1:iter){
                
                sample_dusuk <- sample(prices_dusuk , size = n)
                sample_yuksek <- sample(prices_yuksek , size = n)
                
              
                if(parametric == TRUE){
                    sonuc <- t.test(sample_yuksek , sample_dusuk , mu = mu ,
                           alternative = alternative , conf.level = cl)
                }else{
                    sonuc <- wilcox.test(sample_yuksek , sample_dusuk , mu = mu ,
                                alternative = alternative , conf.level = cl)
                }
                
                
                if(sonuc$p.value > kr){
                  hipotezSonuc[i] <- "KABUL"
                }else{
                  hipotezSonuc[i] <- "RED"
                }
              
            }
          
          tab <- table(hipotezSonuc)
          return(tab)
}
  
  
testSample(data = df , n = 100 , iter = 1000 , cl = 0.95 , mu = 0 ,
            alternative = "two.sided" , parametric = FALSE)
  
testSample(data = df , n = 100 , iter = 1000 , cl = 0.95 , mu = 15 ,
           alternative = "two.sided" , parametric = TRUE)
