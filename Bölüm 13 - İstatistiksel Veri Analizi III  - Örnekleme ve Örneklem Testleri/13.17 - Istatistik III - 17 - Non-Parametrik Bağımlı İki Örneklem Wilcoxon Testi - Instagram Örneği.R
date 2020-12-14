
ins <- InsPostComparison

duration <- c(ins$RPostsDuration , ins$LPostsDuration)
duration
groups <- c(rep("Rastgele" , 50 ) , rep("Beğenilen" , 50))

df <- data.frame("duration" = duration , "groups" = groups)
View(df)


shapiro.test(df$duration[df$groups == "Rastgele"])
shapiro.test(df$duration[df$groups == "Beğenilen"])

bartlett.test(df$duration ~ df$groups)

?t.test
t.test(df$duration ~ df$groups , mu = 0 , paired = T)

# Ho : Fark 0'dır
# Ha : Fark 0 değildir


t.test(df$duration ~ df$groups , mu = 10 , paired = T , alternative = "greater")
t.test(df$duration ~ df$groups , mu = 3 , paired = T , alternative = "greater")
t.test(df$duration ~ df$groups , mu = 10 , paired = T , alternative = "two.sided")

## Non-Prametrik Bağımlı İki Örneklem Wilcox Testi 


View(ins)

?wilcox.test

par(mfrow=c(1,2))
hist(ins$RPostsViewed)
hist(ins$LPostsViewed)


shapiro.test(ins$RPostsViewed)
shapiro.test(ins$LPostsViewed)


median(ins$RPostsViewed)
median(ins$LPostsViewed)


wilcox.test(ins$LPostsViewed , ins$RPostsViewed , mu = 10 , paired = T , 
            conf.int = TRUE)

wilcox.test(ins$LPostsViewed , ins$RPostsViewed , mu = -10 , paired = T , 
            conf.int = TRUE , alternative = "greater")


wilcox.test(ins$RPostsViewed , ins$LPostsViewed , mu = 10 , paired = T , 
            conf.int = TRUE , alternative = "greater")



