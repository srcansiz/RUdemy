## Binom Testi


?binom.test

soru1 <- SPSS_Gorus_Anketi$`Mesleğim gereği istatistik yazılımlarını kullanmayı öğrenmem gerekir.`
table(soru1)

Soru_1_Binom <- soru1[soru1 == 'Katılıyorum']
Soru_1_Binom <- append(Soru_1_Binom , soru1[soru1 == 'Katılmıyorum'] )

table(Soru_1_Binom)


binom.test(x = 24 , n = 30 , p = 0.5 )

# Ho : Katılıyorumlar oranı 0.5 eşittir 
# Ha : Katılıyorumlar oranı 0.5'e eşit değildir


binom.test(x = 24 , n = 30 , p = 0.7 , alternative = 'greater' )

# Ho : Katılıyorumlar oranı 0.5 eşittir ve küçüktür 
# Ha : Katılıyorumlar oranı 0.5 ten büyüktür

binom.test(x = c(24,6) , p = 0.7 , alternative = 'greater' )

# Ho : Katılıyorumlar oranı 0.5 eşittir ve küçüktür 
# Ha : Katılıyorumlar oranı 0.5 ten büyüktür




