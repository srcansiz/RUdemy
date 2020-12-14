View(iris)

hist(iris$Sepal.Length)

View(warpbreaks)

# Histogram 
hist(warpbreaks$breaks)

shapiro.test(warpbreaks$breaks)

?wilcox.test


wilcox.test(x = warpbreaks$breaks , 
            mu = 40 )

# Ho: Ortanca değer 40'a eşit
# Ha: Ortanca değer 40'a eşit değil

median(warpbreaks$breaks)

# Alternatif küçüktür
wilcox.test(x = warpbreaks$breaks , 
            mu = 40  , alternative = "less")

# Ho: Ortanca değer 40'a eşit veya büyüktür
# Ha: Ortanca değer 40'tan küçüktür


# Alternatif büyüktür
wilcox.test(x = warpbreaks$breaks , 
            mu = 40  , alternative = "greater")

# Ho: Ortanca değer 40'a eşit veya küçüktür N: Kabul edldil
# Ha: Ortanca değer 40'tan büyüktür


