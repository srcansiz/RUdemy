


minMaxNorm <- function(x) {
   
      return((x - min(x)) / (max(x) - min(x)))
}

min(minMaxNorm(df$cdur))
max(minMaxNorm(df$cdur))

df$cdur <- minMaxNorm(df$cdur)*100
df$vdur <- minMaxNorm(df$vdur)*100
df$wordfreq<- minMaxNorm(df$wordfreq)*100




