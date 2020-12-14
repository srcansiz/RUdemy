

# Bağımsız Örneklem T-Testi Uygulama 

View(iris)

df <- subset(iris , subset = (Species != "virginica"))
class(df$Species)
df$Species <- as.character(df$Species)
View(df)

par(mfrow = c(1,2))
hist(df$Sepal.Width[df$Species == "setosa"])
hist(df$Sepal.Width[df$Species == "versicolor"])

shapiro.test(df$Sepal.Width[df$Species == "setosa"])
shapiro.test(df$Sepal.Width[df$Species == "versicolor"])
# Ho : Normal Dağılr
# Ha : Normal değildir



bartlett.test(df$Sepal.Width ~ df$Species)
# Ho: Varyanslar homojendir
# Ha : Varyanslar homojen değildir

# 1. varsayım tamam  iki grupta normal dağılıyor
# 2. varsayım homojen var. tamamdır

?t.test

t.test(df$Sepal.Width ~ df$Species , mu = 0 , var.equal = TRUE  )

# Ho: İki grup ortalaması birbirne eşittir = farkı 0 
# Ha: eşit değildir

t.test(df$Sepal.Width ~ df$Species , mu = 0.7 , var.equal = TRUE  )

t.test(df$Sepal.Width ~ df$Species , mu = 0.7 , var.equal = TRUE ,
        alternative = "greater"
       )

# Ho: İki grubun arasındaki fark 0.7 den küçük veya eşittir 
# Ha: İki grubun arasındaki fark 0.7 den büyüktür

t.test(df$Sepal.Width ~ df$Species , mu = 0.7 , var.equal = TRUE ,
       alternative = "less"
)
# Ho: İki grubun arasındaki fark 0.7 den büyük veya eşittir 
# Ha: İki grubun arasındaki fark 0.7 den küçüktür

t.test(df$Sepal.Width ~ df$Species , mu = 1.5 , var.equal = TRUE ,
       alternative = "less"
)


t.test(df$Sepal.Width ~ df$Species , mu = 1.5 , var.equal = FALSE ,
       alternative = "less"
)

