
x <- seq(from = 100 , to = 300 , by = 10)
x

sample(x)
sample(x , replace = TRUE)


# Sample fonksiyonu çağırıldığında her seferinde farklı sonuç verir 
sample(x)
sample(x)

y <- sample(x)
y
y
