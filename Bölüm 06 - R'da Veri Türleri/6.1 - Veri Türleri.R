# Integer (Tam sayı)
# Numeric (Reel )
# Character (String , Nominal)
# Factor (Ordinal)
# Logical (Mantıksal T , F)

x <- c(12,12,12,34,56)
class(x)
y <- c('A' , 'B' , 'C')
class(y)

?factor
f <- factor(c('A' , 'B' , 'C'))
class(f)

l <- c(T,F,T,T,F)
class(l)
