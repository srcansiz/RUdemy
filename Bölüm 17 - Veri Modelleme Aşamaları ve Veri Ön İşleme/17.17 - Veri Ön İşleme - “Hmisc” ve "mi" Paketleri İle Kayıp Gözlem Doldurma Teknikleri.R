

### Hmisc ve mi  Paketleri ile Kayıp Gözlemlerin Doldurulması
install.packages("Hmisc")
install.packages("mi")
library(Hmisc)
library(mi)

# data : student_placement_data_with_NA.csv

df <- student_placement_data_with_NA
## Değişken Seçimleri
new_df <- df[c("Acedamic.percentage.in.Operating.Systems" , 
               "percentage.in.Algorithms",
               "Percentage.in.Programming.Concepts",
               "certifications",
               "workshops",
               "reading.and.writing.skills")]

# Değişken İsimlerinn değiştirilmesi
names(new_df) <- c("Operating" , "Algorithms" , "Concepts" , 
                   "Cert" , "Works" , "ReadingWriting")

View(new_df)

new_df$ReadingWriting <- factor(new_df$ReadingWriting , 
                                levels = c("poor" , "medium" , "excellent"),
                                ordered = T
)

?impute

result <- impute(new_df$Operating , fun = "random")
result <- impute(new_df$Operating , fun = mean)
result <- impute(new_df$Operating , fun = median)
as.numeric(result)

?aregImpute
?mi


result <- aregImpute(~ Operating + Algorithms + Concepts + Cert , 
                     data  = new_df , n.impute = 3)
names(result)

result


result <- mi(new_df , n.iter = 2)

result
summary(result)


