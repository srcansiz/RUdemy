
df <- data.frame('A' = c(12,14,15,16,17) , 
                 'B' = c(12,17,67,54,34) , 
                 'C' = c('a' , 'b' , 'c' , 'd' , 'e'))
df


length(df$A)

# Satır sayısı
nrow(df)

# Sütun sayısı
length(df)
ncol(df)

# Hem satır hem sütun sayısı verir
d <- dim(df)
d[1]
d[2]

