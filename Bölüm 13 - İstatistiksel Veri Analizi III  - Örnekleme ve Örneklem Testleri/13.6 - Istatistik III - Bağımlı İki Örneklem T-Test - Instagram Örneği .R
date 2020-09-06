
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

