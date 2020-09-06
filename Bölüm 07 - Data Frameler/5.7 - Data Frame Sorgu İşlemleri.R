
df <- data.frame( 'A' = rnorm(100 , mean = 10 , sd = 2), 
                  'B' = rnorm(100 , mean = 34 , sd = 10) , 
                  'C' = rnorm(100 , mean = 45 , sd = 15))
df
View(df)


df$A

df$A < 8
which(df$A < 8)

idx <- which(df$A < 8)

# A'nın 8 den küçük olan alt kümesi
df[idx,]

df[idx, c('B' , 'C')]

df2 <- df[idx, c('B' , 'C')]
df2

class(df2)


df

mean(df$B)

df$B < mean(df$B)
idx2 <- which(df$B < mean(df$B))

df[idx2 ,]
df[idx2 , c('A' , 'C')]


View(df[idx2 , c('A' , 'C')])
