

### mice Paketi ile Kayıp Gözlemlerin Doldurulması
install.packages("mice")
library(VIM)
library(mice)
names(df)
df <- student_placement_data_with_NA
## Değişken Seçimleri
new_df <- df[c("Acedamic.percentage.in.Operating.Systems" , 
               "percentage.in.Algorithms",
               "Percentage.in.Programming.Concepts",
               "certifications",
               "workshops",
               "reading.and.writing.skills")]

View(new_df)

# Değişken İsimlerinn değiştirilmesi
names(new_df) <- c("Operating" , "Algorithms" , "Concepts" , 
                   "Cert" , "Works" , "ReadingWriting")

fig <- aggr(new_df , col = c("orange" , "red") , labels = names(new_df),
            numbers = TRUE , sortVars = TRUE, cex.axis = 0.6 , 
            ylab(c("Histogram of Missing Values" , "Pattern"))
            )

?mice
new_df$ReadingWriting

new_df$ReadingWriting <- factor(new_df$ReadingWriting , 
                                levels = c("poor" , "medium" , "excellent"),
                                ordered = T
                                )
new_df$ReadingWriting

## Veri türlerine göre methodlar = default method
# 1 - Numeric 
# 2 - İki seviyeli faktör
# 3 - İkiden fazla seviyeli faktör
# 4 - İkiden fazla sıralı seviyeli faktör
imputed <- mice(data = new_df , m = 3 , maxit = 3 , 
                method = NULL , 
                defaultMethod = c("pmm" ,"logreg" , "lda" , "polr")
                )
## Imputation sonuçları
summary(imputed)

## Imputation içerisindeki nesneler
names(imputed)
imputed$m

# Tüm imputation sonuçları
imputed$imp

## Operating Imputation sonuçları
imputed$imp$Operating

## Reading Writing Imputation sonuçları
imputed$imp$ReadingWriting

## 3. imputation değerleri ile veri setini doldur. 
imputedData <- complete(imputed , 3)
View(imputedData)

## Her Değişken için farklı method uygulama
imputed2 <- mice(data = new_df , m = 3 , maxit = 3 , 
                 method = c("rf" ,"cart" , "rf" , "sample" , "sample" ,
                            "polr")
)



