
# Vektorler  

x <- c(1,2,3,4,5)
y <- c('A' , 2 , 3 ,4)

# Veri tipi kontrol etme
class(y)
class(x)

# VEktor içerisine vektor ekleme  
z <- c(10 ,11,12 , 12 , x)


# Listeler 
l <- list(1,2,3,4,5)
l1 <- list(2 , 3 , 'A' , 'B')
l2 <- list(2 ,3 , c(10,11,12,13))
l3 <- list(2,3,4 , list(1,2,3) , list(1,c(1,2,3,4)))

#Matris
m <- matrix(c(10,15,20,25) , nrow=2 , ncol=2)

# Listeye matrisin eklenmesi
l4 <- list('Vector' = c(10,11,12,13) , 'Matris' = m)

# Data Frame
df <- data.frame('a' = c(1,2,3,4,5) , 'b' = c(11,12,13,14,15))

# Listeye data frame eklenmesi
l5 <- list('Vector' = c(10,11,12,13) , 'Matris' = m , 'DF' = df)

