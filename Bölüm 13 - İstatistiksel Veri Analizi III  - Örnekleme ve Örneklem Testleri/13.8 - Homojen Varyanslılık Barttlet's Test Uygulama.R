
View(iris)


df <- subset(iris , subset = ( Species != "setosa" ))
View(df)

boxplot( df$Sepal.Width ~ as.character(df$Species) )

bartlett.test( df$Sepal.Width ~ as.character(df$Species) )

# Ho: Varyanslar homojendir 
# Ha: Değildir


boxplot( df$Sepal.Length ~ as.character(df$Species) )
bartlett.test( df$Sepal.Length ~ as.character(df$Species) )


shapiro.test(df$Sepal.Width[df$Species == 'versicolor'])
shapiro.test(df$Sepal.Width[df$Species == 'virginica'])



