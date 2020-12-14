
nrow(df)

hist(df$math.score)

mean(df$math.score)

t.test(df$math.score , mu = 70 )

sample1 <- sample(df$math.score , size = 50)
t.test(sample1 , mu = 70 )

sample2 <- sample(df$math.score , size = 50)
t.test(sample2 , mu = 70 )

result <- character(50)
for(i in 1:50){
  
     ornek <- sample(df$math.score , size = 50)
     sonuc <- t.test(ornek , mu = 70)
     p <- sonuc$p.value 
     
     if(p >= 0.05){
       result[i] <- "KABUL"
     }else{
       result[i] <- "RED"
     }
     
}

result
table(result)



