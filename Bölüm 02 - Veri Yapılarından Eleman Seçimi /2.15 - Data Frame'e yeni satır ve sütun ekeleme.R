df <- data.frame('A' = c(1,2,3,4) , 
                 'B' = c('A' , 'B' , 'C' , 'D'),
                 'C' = c(11,22,33,44))


cbind(df , 'D' = c(33,44,55,66))
df
df <- cbind(df , 'D' = c(33,44,55,66))
df

df[5] <- c(12,13,14,15)
df
df$Yeni <- c('F' , 'G' , 'H' , 'Z')
df

df['Yeni2'] <- c(1,2,3,4)
df

# YEni satır ekleme 

df[5 , ] <- c(1,2,3,4,5,6 , 7)
df
df[6 , ] <- c(1,'A',3,4,5,6 , 7)
df

df[5,2] <- 'T'
df
class(df[,2])

df[7 , ] <- c(1,'C',3,4,5,6 , 7)
df
df[5,2] <- 'A'
df
class(df$Yeni)

df
rbind(df , data.frame('A' = c(1) , 'B' = c('C') , 
                      'C' = c(23) , 'D' = c(13) , 'V5' = c(23),
                      'Yeni'= c('F') , 'Yeni2' = c(13) ))

rbind(df , data.frame('A' = c(1 ,2) , 'B' = c('C' ,'A') , 
                      'C' = c(23 ,24) , 'D' = c(13 ,14) , 'V5' = c(23 , 24),
                      'Yeni'= c('F' ,'A') , 'Yeni2' = c(13 , 14) ))

eklenecek <- data.frame('A' = c(1 ,2) , 'B' = c('C' ,'A') , 
          'C' = c(23 ,24) , 'D' = c(13 ,14) , 'V5' = c(23 , 24),
          'Yeni'= c('F' ,'A') , 'Yeni2' = c(13 , 14) )

eklenecek

rbind(df , eklenecek)

eklenecek <- data.frame('A' = c(1 ,2) , 'B' = c('C' ,'T') , 
                        'C' = c(23 ,24) , 'D' = c(13 ,14) , 'V5' = c(23 , 24),
                        'Yeni'= c('F' ,'A') , 'Yeni2' = c(13 , 14) )

df <- rbind(df , eklenecek)


eklenecekSutun <- data.frame('J' = c(1,2,3,4,5,6,7,8,9) , 'E' = c(1,2,3,4,5,6,7,8,9))
eklenecekSutun

cbind(df , eklenecekSutun)
