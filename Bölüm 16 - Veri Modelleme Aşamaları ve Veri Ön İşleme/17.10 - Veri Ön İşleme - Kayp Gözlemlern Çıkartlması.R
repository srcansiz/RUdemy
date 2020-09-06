
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





