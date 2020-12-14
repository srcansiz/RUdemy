

### Vektörlerden Rastgele Örneklem Alımı

x <- seq(from = 10 , to = 200 , length.out = 50)

length(x)


# Rastgele sıralama
sample(x)

# Rastgele 1 eleman alama
sample(x , size = 1)


set.seed(165)
sample(x , size = 1)


set.seed(175)
sample(x , size = 1)


sample(x , size = 20)
sample(x , size = 60 , replace = TRUE)


set.seed(165)
sample(x , size = 20)
sample(x , size = 60 , replace = TRUE)





