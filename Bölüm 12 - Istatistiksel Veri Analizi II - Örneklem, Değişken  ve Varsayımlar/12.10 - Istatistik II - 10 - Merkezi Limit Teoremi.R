
# Z vektorü popülasyon
z <- c(10,15,14,18,10,23,23,23,56,34,13,19,19,45,45,34)

hist(z)

# Rastgele örnek seçimi 
sample(z , size = 4)

# Ortalama vektoru oluşturma
sonuc <- numeric(50)
for(i in 1:50){
        ornek <- sample(z , size = 4)
        sonuc[i] <- mean(ornek)
}
sonuc

par(mfrow = c(1,2))
hist(z)
hist(sonuc)


