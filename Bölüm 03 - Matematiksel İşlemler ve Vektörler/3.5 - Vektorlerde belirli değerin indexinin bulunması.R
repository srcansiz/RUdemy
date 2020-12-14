
x <- c(12,34,56,45,78,54)

x

y = 5
y == 5


x == 5
x == 78

which(x == 34)

t <- c(5,34,23,5,6)

which(t == 5)

bes = which(t == 5)
bes
# 5 e eşit olan elemanları seçer
t[bes]

t[which(t == 5)]

t[t==5]

t==5
class(t==5)
