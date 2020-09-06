
View(warpbreaks)

shapiro.test(warpbreaks$breaks[warpbreaks$wool == "A"])
shapiro.test(warpbreaks$breaks[warpbreaks$wool == "B"])

boxplot(warpbreaks$breaks ~ warpbreaks$wool)

fligner.test(warpbreaks$breaks ~ warpbreaks$wool)

# Ho : Varyans homojen
# Ha : Değildir

fligner.test(warpbreaks$breaks ~ warpbreaks$wool)
leveneTest(warpbreaks$breaks ~ warpbreaks$wool)
bartlett.test(warpbreaks$breaks ~ warpbreaks$wool)

