

# T-testi 

View(iris)
hist(iris$Sepal.Length)

shapiro.test(iris$Sepal.Length)
?t.test


t.test( x = iris$Sepal.Length , mu = 3 , alternative = "two.sided" , 
        conf.level = 0.95 )

# Ho : Ortalama eşittir test değeri (3)
# Ha : Ortalama eşit değildir test değerine (3)


sonuc <- t.test( x = iris$Sepal.Length , mu = 3 , alternative = "two.sided" , 
        conf.level = 0.95 )

names(sonuc)

sonuc$statistic
sonuc$p.value
sonuc$conf.int[1]

t.test( x = iris$Sepal.Length , mu = 3 , alternative = "less" , 
        conf.level = 0.95 )

# Ho : Ortalama değeri büyük veya eşittir 3
# Ha : Ortalama değeri küçüktür 3

t.test( x = iris$Sepal.Length , mu = 3 , alternative = "greater" , 
        conf.level = 0.95 )

# Ho : Ortalama değeri küçük veya eşittir 3
# Ha : Ortalama değeri büyüktür 3

t.test( x = iris$Sepal.Length , mu = 5.7 , alternative = "two.sided" , 
        conf.level = 0.95 )


t.test( x = iris$Sepal.Length , mu = 5.8 , alternative = "two.sided" , 
        conf.level = 0.95 )



