
df <- data.frame('A' = c(12,13,14,15,16) , 'B' = c('A' , 'B' , 'C' , 'D' , 'E'))

df[1,1]
df[1,2]

df[,2]
df[,1]
df[5,]

class(df[,2])
class(df[5,])

df2 <- data.frame( 'A' = c(12,13,14,15,16) , 
                   'B' = c('A' , 'B' , 'C' , 'D' , 'E'),
                   'C' = c(45,23,67,89,24))

df2

df2[,c(2,3)]
class(df2[,c(2,3)])

df2[2]
df2[1]
class(df2[1])

df2[['A']]
df2[,1]

class(df2[['A']])
class(df2[,1])


df2[,2] # Vektor
df2[2] # Data frame
df2['B'] # Data frame
df2[['B']] # Vektor

df2$A # vektor
df2$B
df2$C

df2[c('A' , 'B')]
df2[[c('A' ,'B')]] # HAtalı kullanım 
