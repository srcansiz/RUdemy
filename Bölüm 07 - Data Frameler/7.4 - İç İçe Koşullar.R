
CO2
View(CO2)
names(CO2)

df1 <- subset(CO2 , subset = (Type == 'Quebec' | Treatment == 'nonchilled') & 
                             (uptake > 30 & uptake < 35)   
              )
View(df1)
