
x <- c(12,13,14,15,16)
x

# Eleman seçimi 
x[1]
x[5]

# Eleman çıkartma işlemi
x[-1]
x[-5]

# Çıkartma işleminş kalıcı hale getirmek için tekrar atama yapılmalı

x = x[-1]
x = x[-4]
x

x <- c(12,13,14,15,16)
y <- x[-1]

# NOT: 
# Tek satırda birden fazla komut için ; kullanılabilir 
x;y

x[c(1,2,3)]
x[c(-1,-2,-3)]

cıkartılacak <- c(2,3,1)
x[-cıkartılacak]

c <- x[-cıkartılacak]
c

1:3
x[1:3]


# Ardışık indexleri çıkartma 
-1:3
x[-1:3] # Hatalı cıakrtma 
x[-c(1:3)]


