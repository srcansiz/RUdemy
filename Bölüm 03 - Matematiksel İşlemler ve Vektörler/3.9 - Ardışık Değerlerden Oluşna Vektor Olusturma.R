
1:23

-2 : 5

seq(10)
seq(1,10)
seq(-4 , 14)

x <- seq(-4 , 5)
x

seq(from = 0 , to = 10)

df <- data.frame( 'A' = c(1,2,3,4,5) , 'B' = c(34,35,35,34,12))
df

df <- df[-3 , ]
df

uz <- length(df$A)
uz

row.names(df)

row.names(df) <- seq(from = 1 , to = uz)
df
