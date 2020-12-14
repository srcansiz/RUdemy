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


##### Chi-Square Test of Independence #################################
##### Chi-Sqaure Test of Association  #################################


prop.table(table(df1))

tbl <- table(df1)
chisq.test(tbl)

sonuc <- chisq.test(tbl)

sonuc$observed
sonuc$expected


# Ho: İki değişken birbirinden bağımsızdır. İlişki yok
# Ha : İki değişken birbirine bağımlıdır. İlişki var

chisq.test(tbl)

##### -------------------------------------------------#####
### Fisher's Exact Test ####################################
#####--------------------------------------------------#####

tbl

library(tidyverse)

df2 <- df1 %>% filter( x %in% c('Katılıyorum' , 'Katılmıyorum') & 
                       y %in% c('Katılıyorum' , 'Katılmıyorum') )
head(df2)

table(df2)

# 2 x 2 lik tablo odds ratio
fisher.test(table(df2))
fisher.test(table(df2) , alternative = 'less')
fisher.test(table(df2) , alternative = 'greater')

# 5 x5 'lik tablo
fisher.test(table(df1))


##### -------------------------------------------------#####
### McNemar Test ###########################################
#####--------------------------------------------------#####


mcData <- data.frame(
          once = c('Evet' , 'Hayır' , 'Hayır' , 'Evet' , 'Hayır' , 'Hayır'),
          sonra = c('Evet' , 'Hayır' , 'Evet' , 'Hayır' , 'Evet' , 'Evet')
)

tablo <- table(mcData)
tablo

mcnemar.test(tablo)

# Ho : Once ve Sonra arasında herhangi bri değişim yoktur
# Ha : Once ve sonra arasında bir değişim vardır.


