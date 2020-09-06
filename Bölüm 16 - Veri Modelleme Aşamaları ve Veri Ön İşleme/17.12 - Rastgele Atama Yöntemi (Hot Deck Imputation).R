
### Kayıp Gözlemlerin Çıkartıması 
#################################

df <- student_placement_data_with_NA
View(df)

### NA değerli gözlemlerin elde edilmesi
is.na(df)
ids <- which(is.na(df))
length(ids)

### NA değeri olan gözlemlerin çıkartılması
df_new <- na.omit(df)
nrow(df)
nrow(df_new)


### Ortalama Atama Yöntemi (Mean Imputation)
############################################

nas <- which(is.na(df$Acedamic.percentage.in.Operating.Systems))
length(nas)
nrow(df)
ortalama <- mean(df$Acedamic.percentage.in.Operating.Systems , na.rm = T)
ortalama
df$Acedamic.percentage.in.Operating.Systems[nas] <- round(ortalama)

which(is.na(df$Acedamic.percentage.in.Operating.Systems))



### Kayıp Gözlemleri Rastgele Değer Atama 
#########################################


set.seed(123)
rnorm(2)

rnorm(2)

set.seed(123)
rnorm(2)


index <- which(is.na(df$Acedamic.percentage.in.Operating.Systems))
length(index)

random <- sample(df$Acedamic.percentage.in.Operating.Systems[-index],  size = 1)
random

x <- df$Acedamic.percentage.in.Operating.Systems
x[index] <-random
which(is.na(x))

# Orjinal değişken

mean(df$Acedamic.percentage.in.Operating.Systems , na.rm = T)

# Kayıp gözlemsiz 

mean(x)

set.seed(123)
random_many <- sample(df$Acedamic.percentage.in.Operating.Systems[-index] , 
                      size = length(index))
random_many

y <- df$Acedamic.percentage.in.Operating.Systems
y[index] <- random_many


# Orjinal değişken
mean(df$Acedamic.percentage.in.Operating.Systems , na.rm = T)

# Kayıp gözlemsiz 
mean(y)





