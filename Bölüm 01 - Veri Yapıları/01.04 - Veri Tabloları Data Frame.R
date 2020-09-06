
x <- c(10,20,30,40)
y <- c('A' , 'B' , 'C' , 'D')
z <- c(11,22,33,44)

df <- data.frame(x,y,z)
df

View(df)


t <- c(1,2,3,4,5)
e <- c(45,67,56,34,23)
data.frame(x,y,z,t)
data.frame(t,e)

df2 <- data.frame('AVar' = x , 'BVar' = y , 'CVar' = z)
View(df2)

df3 <- data.frame(c(1,2,3,4,5) , 
                  c(34,45,67,89 ,45) ,
                  c(12,34,45,34 ,45))
View(df3)

df4 <- data.frame( 'a' = c(1,2,3,4,5) , 
                  'b' = c(34,45,67,89 ,45) ,
                  'c' = c(12,34,45,34 ,45))
View(df4)



df5 <- data.frame( a = c(1,2,3,4,5) , 
                   b = c(34,45,67,89 ,45) ,
                   c = c(12,34,45,34 ,45))
View(df5)

df6 <- data.frame( 'a b' = c(1,2,3,4,5) , 
                   'b c' = c(34,45,67,89 ,45) ,
                   'c d' = c(12,34,45,34 ,45))
View(df6)
