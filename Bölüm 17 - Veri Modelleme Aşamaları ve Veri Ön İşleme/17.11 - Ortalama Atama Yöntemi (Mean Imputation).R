
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

nas <- which(is.na(df$Acedamic.percentage.in.Operating.Systems))
length(nas)
nrow(df)
ortalama <- mean(df$Acedamic.percentage.in.Operating.Systems , na.rm = T)
ortalama
df$Acedamic.percentage.in.Operating.Systems[nas] <- round(ortalama)

which(is.na(df$Acedamic.percentage.in.Operating.Systems))
