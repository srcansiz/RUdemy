
df <- data.frame('A' = c(1,2,3,4,5) , 'B' = c(4,5,6,7,8))
df

# İkinci sütunun çıkartılmış seçimi
df[-2]
df[-1]

df[2]
# Kaydetme kalıcı halde getirmek için tekrar atama işlemi
df <- df[-2]
df

df <- data.frame('A' = c(1,2,3,4,5) , 'B' = c(4,5,6,7,8))

df[,1]
df[,-1]

df[-1]

df[2] <- NULL
df

df <- data.frame('A' = c(1,2,3,4,5) , 'B' = c(4,5,6,7,8))
df['A'] <- NULL
df

df <- data.frame('A' = c(1,2,3,4,5) , 
                 'B' = c(4,5,6,7,8),
                 'C' = c(11,222,32,41,54))

df[-c(1,3)]
df[,-c(1,3)] # Sonucu vektordur
df[,-3] # Bu bir data frame olur

df[c('A' ,'B')] <- NULL
df


df <- data.frame('A' = c(1,2,3,4,5) , 
                 'B' = c(4,5,6,7,8),
                 'C' = c(11,222,32,41,54))

df <- df[-1,]
df[1,]

df[-c(2:4) ,]
df[-c(1,4),]
