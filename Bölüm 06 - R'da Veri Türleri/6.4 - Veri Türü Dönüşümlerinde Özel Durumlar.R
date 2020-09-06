
x <- factor(c('A' , 'B' , 'C' , 'D'))
class(x)
x
# Factor to numeric
as.numeric(x)

x1 <- factor(c('A' , 'B' , 'C' , 'D' , 'A' ,'B'))
as.numeric(x1)
x1

x2 <- factor(c('D' , 'A' , 'B' , 'D' , 'A' ,'B'))          
class(x2)
x2
as.numeric(x2)

x3 <- factor(c('D' , 'A' , 'C' , 'B') , levels = c('D' , 'A' , 'C' , 'B'))
x3
as.numeric(x3)

x4 <- factor(c("10" ,"12" , "14" , "45"))
x4
as.numeric(x4)

x4C <- as.character(x4)
x4C
x4N <- as.numeric(x4C)
x4N
class(x4N)
