

## Liste Tipi Veri Yapısı

x <- c(1,2,3,4,5,6)
x


# Liste Oluşturma 

# Nümerik 
l1 <- list(13,56,47,89)
l1

# Karakter
l2 <- list('A' ,'B')
l2

# Hem karakter hem de nümerik
l3 <- list('A' , 'B' , 2 , 'C' , 6)
l3


# Liste içerisinde vektör

l4 <- list(c(1,2,3,4,5) , 'A' , 5)
l4


l5 <- list('a' = c(1,2,3,4,5) , 'b' = 'A')
l5

g = c(56,67)

l6 <- list('a' = g , 'b' = g)
l6

f <- c(45,56)
h <-c(1,2)

fh <- c(f,h)
fh
