
data()


CO2
View(CO2)


?subset

names(CO2)

df2 <- subset(CO2 , subset = (uptake > 30 & Type == 'Quebec') )
nrow(CO2)
nrow(df2)

df3 <- subset(CO2 , subset = (uptake > 30 & Type == 'Quebec') , 
              select = c(Treatment , conc) ) 

View(df3)
nrow(df3)


df4 <- subset(CO2 , subset = (uptake > 30 | Type == 'Quebec') ) 

View(df4)
nrow(df4)