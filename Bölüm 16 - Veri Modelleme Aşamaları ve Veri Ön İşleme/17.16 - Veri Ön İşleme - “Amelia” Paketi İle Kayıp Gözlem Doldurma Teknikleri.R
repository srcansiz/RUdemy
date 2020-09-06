

### Amelia Paketi ile Kayıp Gözlemlerin Doldurulması
install.packages("Amelia")
library(Amelia)

## MCAR - Kayıp gözlem, gözlemlenen değerlere ve kayıp değerlere dayalı değil 
## MAR - Missing at Random - Kayıp gözlem, gözlenen değerleri dayalı 
## MNAR - Missing not at random - Kayıp gözlem gözlenmeyen bir değere bağlı


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


new_df$ReadingWriting <- factor(new_df$ReadingWriting , 
                                levels = c("poor" , "medium" , "excellent"),
                                ordered = T
)

?amelia

result <- amelia(x = new_df , m = 3 , 
       noms = c("Cert" , "Works") , 
       ords = c("ReadingWriting") )

names(result)
result$imputations

write.amelia(result , file.stem = "results")

###





####



