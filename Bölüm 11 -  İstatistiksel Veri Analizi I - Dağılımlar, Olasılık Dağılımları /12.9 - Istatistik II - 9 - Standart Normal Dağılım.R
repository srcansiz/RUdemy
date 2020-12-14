
# Standart Normal Dağılım 


# Normal Dağılım
dnorm( x = 20 , mean = 15 , sd = 5)

# Standart Normal Dağılım
dnorm( x = 20 , mean = 0 , sd = 1)
dnorm( x = 0.6 , mean = 0 , sd = 1)
dnorm( x = -0.6 , mean = 0 , sd = 1)


vec <- seq(0,1 , by = 0.001)

plot(x = vec , y = dnorm(x = vec, mean = 0 , sd = 1 ) , 
     bty = "L" ,
      pch = 19
     )

vec2 <- seq(-1,1 , by = 0.001)
plot(x = vec2 , y = dnorm(x = vec2, mean = 0 , sd = 1 ) , 
     bty = "L" ,
     pch = 19
)


rnorm(n = 100 , mean = 0 , sd = 1)

