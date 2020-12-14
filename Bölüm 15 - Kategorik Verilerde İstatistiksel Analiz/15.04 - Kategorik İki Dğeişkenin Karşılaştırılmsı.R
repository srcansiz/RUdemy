####################################################
## Binom Testi #########################################################################
####################################################

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


###################################################
## Chi-Square Goodness of Fit Test ###################################------------------------
###################################################

# Ki-Kare = sum( (Oi-Ei)^2 / Ei)
# Ki-Kare eğer 2 kategori beklenen değerler en az 5 olmalı

## Veri Setinin Okunması
library(readxl)
SPSS_Gorus_Anketi <- read_excel("Documents/RTutorial/Datasets/SPSS_Gorus_Anketi.xlsx")
View(SPSS_Gorus_Anketi)

soru1 <- SPSS_Gorus_Anketi$`Mesleğim gereği istatistik yazılımlarını kullanmayı öğrenmem gerekir.`
table(soru1)
length(soru1)

0.20*55


?chisq.test
sonuc <- chisq.test(table(soru1))

# Ho: Beklenen değerler gözlemlenen değerlere eşittir
# Ha: Beklenen değerler gözlemlenen  değerlere eşit değildir. 
# 0.00002 < 0.05 | %95 güven düzeyi Ho Red
sonuc$expected
sonuc$observed

sonuc2 <- chisq.test(table(soru1) , p = c(0.1 , 0.2 , 0.5 , 0.1 , 0.1 ))
sonuc2$observed
sonuc2$expected
sonuc2
# Ho: Beklenen değerler gözlemlenen değerlere eşittir
# Ha: Beklenen değerler gözlemlenen  değerlere eşit değildir. 
# 0.56 < 0.05 | %95 güven düzeyi Ho Kabul

sonuc3 <- chisq.test(table(soru1) , p = c(0.05 , 0.2 , 0.5 , 0.15 , 0.1 ))
# Herhangi beklenen değerler 5'ten küçük olamamalı





###################################################################
### Kategorik İki Değişkenin Karşılaştırılması ####################
###################################################################

df1 <- data.frame(x = SPSS_Gorus_Anketi$`Mesleğim gereği istatistik yazılımlarını kullanmayı öğrenmem gerekir.`,
                  y = SPSS_Gorus_Anketi$`Sosyal bilimlerde istatistik hesaplamalarının ve istatistiksel yazılımların gerekli olduğunu düşünüyorum.`)

table(df1$x , df1$y)
table(df1) 
#######



############ 







##### Chi-Square Test of Independence #################################
##### Chi-Sqaure Test of Association  #################################

df <- data.frame(x = SPSS_Gorus_Anketi$`Mesleğim gereği istatistik yazılımlarını kullanmayı öğrenmem gerekir.`,
                 y = SPSS_Gorus_Anketi$`Sosyal bilimlerde istatistik hesaplamalarının ve istatistiksel yazılımların gerekli olduğunu düşünüyorum.`)

table(df)



sonuc <- chisq.test(table(df))
sonuc$observed
sonuc$expected






