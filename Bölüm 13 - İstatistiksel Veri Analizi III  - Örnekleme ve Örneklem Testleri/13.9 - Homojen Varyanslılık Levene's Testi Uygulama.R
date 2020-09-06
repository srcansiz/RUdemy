
## Levene's Test

install.packages("car")
library(car)
?leveneTest

View(iris)
leveneTest()

df <- subset(iris , subset = (Species != 'virginica')) 

boxplot(df$Sepal.Width ~ as.character(df$Species) )

leveneTest(df$Sepal.Width ~ as.character(df$Species))
bartlett.test(df$Sepal.Width ~ as.character(df$Species))

# Ho : Homojen varyanslıdır
# Ha : değildir

shapiro.test(df$Sepal.Width[df$Species == 'versicolor'])
shapiro.test(df$Sepal.Width[df$Species == 'setosa'])

