

### missForest Paketi ile Kayıp Gözlemlerin Doldurulması
install.packages("missForest")
library(missForest)

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

?missForest

library(rstatix)
new_df <- sample_n_by(new_df , size = 5000)
new_df <- as.data.frame(new_df)

result <- missForest(new_df , maxiter = 4)

summary(result)
result

result$ximp
result$OOBerror

