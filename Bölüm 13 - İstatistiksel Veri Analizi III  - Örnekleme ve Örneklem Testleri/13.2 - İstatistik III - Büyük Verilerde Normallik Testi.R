
df <- StudentsPerformance

nrow(df) # 1000 Satır

hist(df$math.score)

# Ho: Dağılım normaldir
# Ha: Dağılım normal değildir. 
# 0.05 
shapiro.test(df$math.score)

clean <- df$math.score[-which( df$math.score < 30)]
hist(clean)

shapiro.test(clean)

# İlk 100 örnek
shapiro.test(clean[1:100])

# 100 ile 200 arası
shapiro.test(clean[100:200])

# 200 ile 300 arası
shapiro.test(clean[200:300])

sample1 <- sample(clean ,  size = 100)
shapiro.test(sample1)
sonuc <- shapiro.test(sample1)
sonuc

names(sonuc)

sonuc$p.value

pvalues <- numeric(50)

for(i in 1:50){
      
      ornek <- sample(clean , size = 100)
      sonuc  <- shapiro.test(ornek)
      pvalue <- sonuc$p.value 
      pvalues[i] <- pvalue
}

pvalues

# Ortalama P Değerleri
mean(pvalues)


