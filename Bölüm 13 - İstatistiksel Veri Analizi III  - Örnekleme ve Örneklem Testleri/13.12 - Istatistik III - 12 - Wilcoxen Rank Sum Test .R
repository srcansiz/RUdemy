
?wilcox.test

View(warpbreaks)

shapiro.test(warpbreaks$breaks[warpbreaks$wool == "A"])
shapiro.test(warpbreaks$breaks[warpbreaks$wool == "B"])

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 0)

# Ho : Grupların lokasyonlarının kayması 0 'a eşittir 
# Ha : Grupların lokasyonlarının kaymanı 0'a eşit değildir

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 0 , 
            conf.int = TRUE
            )

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 15 , 
            conf.int = TRUE
)

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = 15 , 
            conf.int = TRUE , alternative = 'less'
)

#Ho: İki grubun lokasyonları arasındaki kayma 15'e eşit veya büyük
#Ha: İki grubun lokasyonları arasındaki kayma 15den azdır

wilcox.test(warpbreaks$breaks ~ warpbreaks$wool , mu = -15 , 
            conf.int = TRUE , alternative = 'greater'
)


