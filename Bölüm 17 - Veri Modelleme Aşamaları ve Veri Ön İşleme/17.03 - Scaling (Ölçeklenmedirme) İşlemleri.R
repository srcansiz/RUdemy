


minMaxNorm <- function(x) {
   
      return((x - min(x)) / (max(x) - min(x)))
}

min(minMaxNorm(df$cdur))
max(minMaxNorm(df$cdur))

df$cdur <- minMaxNorm(df$cdur)*100
df$vdur <- minMaxNorm(df$vdur)*100
df$wordfreq<- minMaxNorm(df$wordfreq)*100



## Scaling İşlemi
?scale

scale(df$vdur)
mean(df$vdur)
sd(df$vdur)

## Manuel ortalama ve standart sapme ile scaling
scale(df$vdur , center = 50, scale = 5)

par(mfrow = c(2,1))
hist(df$vdur)
hist(scale(df$vdur))


