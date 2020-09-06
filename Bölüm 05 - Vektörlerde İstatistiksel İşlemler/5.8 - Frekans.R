
x <- c(12,12,13,13,14,14,13,12,12,15,15,16)
length(x) 

unique(x)


table(x)

t <- table(x)
t
names(t)

t[1]
t["12"]
class(t["12"])

t[["12"]]

class(t)

t[1]
t[[1]]
t["12"]
t[["12"]]
t


c <- c('A' , 'A' , 'A' , 'B' , 'B' , 'C')
c

table(c)
t <- table(c)
t['A']
t[['A']]
t[1]
t[2]
