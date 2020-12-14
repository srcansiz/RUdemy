
#### Çoklu Doğrusal Regresyon 

### Australia Rain Dataset
### Nem oranı tahmin modeli

df_albury <- weatherAUS[ weatherAUS$Location == "Albury"  , ]
nrow(df_albury)

names(df_albury)
df_albury <- df_albury[c("Humidity9am" , "MinTemp" , 
            "MaxTemp" , "WindSpeed9am" , "Pressure9am" , "Temp9am" , "Rainfall")]

cor(na.omit(df_albury))

pairs(na.omit(df_albury) , pch = 19)


