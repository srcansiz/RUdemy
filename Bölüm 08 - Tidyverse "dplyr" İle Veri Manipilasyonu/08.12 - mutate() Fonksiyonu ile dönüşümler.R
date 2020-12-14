
### Tidyverse ###########3


### Tidyverse yükleme işlemi
install.packages("tidyverse")
library(tidyverse)

# data_new <- data %>% select(v1) %>% filter(v1 > 5)


### Select() Fonksiyonu İle Değişken Seçimi 

View(iris)

iris_new <- iris %>% select(Sepal.Length , Sepal.Width)
View(iris_new)


### slice() Fonksiyonu ile Satırlar Bazında Seçim

iris %>% slice(1:15)
iris %>% slice(c(1,2,4,5,6,9))


iris %>% select(Sepal.Length , Sepal.Width) %>% slice(1:5)


###  slice_min() ve slice_max() Fonksiyonları

## Numeric 
iris %>% slice_min(order_by = Sepal.Length , n = 10)
iris %>% slice_max(order_by = Sepal.Length , n = 10)

## Character
iris %>% slice_max(order_by = Species , n = 10)
iris %>% slice_min(order_by = Species , n = 10)

# slice_sample() Fonksiyonu ile Rastgele Gözlem Seçimi


iris %>% slice_sample(n = 10)

###  distinct() Fonksiyonu ile Unique Değerler

iris %>% distinct(Species)
iris %>% distinct(Species , .keep_all = TRUE)


### arrange() Fonskiyonu ile Sıralama

# tek değişkenle sıralama (Küçükten büyüğe doğru)
iris %>% arrange(Sepal.Width )

# İki değişkenle sıralama 
iris %>% arrange(Sepal.Width ,Sepal.Length)


# Tek tdeğişkenle büyükten küçüğe doğru 

iris %>% arrange(desc(Sepal.Width) , desc(Sepal.Length))
iris %>% arrange(desc(Sepal.Width) , Sepal.Length)



# summarise() Fonksiyonu ile özet bilgilerin sunulması

iris %>% summarise( Mean = mean(Sepal.Length) ,
                    Median = median(Sepal.Length) ,
                    Sd = sd(Sepal.Length))


# group_by() Fonksiyonu ile gruplama 


df <- iris %>% group_by(Species , )
class(df)
print(df , n = 150)


extra <- c(rep('A' , 30) , rep('B' , 30) , rep('C' , 30) , rep('D' , 30) , rep('E' , 30))

iris$extra <- extra
View(iris)


iris %>% group_by(Species , extra)

##  group_by() Fonksiyonu  ile summarise() Kullanımı

iris %>% group_by(Species) %>% summarise(
                                    
                                  SepalLengthOrtalama = mean(Sepal.Length),
                                  Sepal.Width = mean(Sepal.Width),
                                
                                    )

iris %>% group_by(Species , extra) %>% 
  summarise(
      SepalLengthOrtalama = mean(Sepal.Length),
      Sepal.Width = mean(Sepal.Width),
    )


minMax <- function(x) {
  return(min(x) - max(x))
}


iris %>% group_by(Species , extra) %>% 
  summarise(
    SepalLengthOrtalama = mean(Sepal.Length),
    Sepal.Width = mean(Sepal.Width),
    MinMax = minMax(Sepal.Length)
  )


# Filter() Fonksiyonu

iris %>% filter(Sepal.Length < 5)
iris %>% filter(Sepal.Length < 5 , Sepal.Width > 3)
iris %>% filter(Sepal.Length < 5 | Sepal.Width > 3)
iris %>% filter(Sepal.Length < 5 & Sepal.Width > 3)
iris %>% filter(Sepal.Length < 5 & Sepal.Width > 3) %>% select(Sepal.Length , Sepal.Width)

iris %>% filter(Sepal.Length < 5 & Sepal.Width > 3) %>% 
  select(Sepal.Length , Sepal.Width , Species)
  

iris %>% 
    filter(Sepal.Length < 5 & Sepal.Width > 3) %>% 
    select(Sepal.Length , Sepal.Width , Species) %>%
    group_by(Species) %>%
    summarise(
      Sepal.WidthMean = mean(Sepal.Width),
      Sepal.LengthMean = mean(Sepal.Length)
      )

## mutate() Fonskiyonu

iris %>% mutate(Sepal.Length = log(Sepal.Length))
iris %>% mutate(Sepal.LengthLog = log(Sepal.Length))
iris %>% mutate(Sepal.LengthLog = log(Sepal.Length))

# Değişken türü değiştirme
df <- iris %>% mutate(Species = as.character(Species))
class(df$Species)

iris %>% mutate_if(is.numeric , function(x){ x*10} )

iris %>% mutate_if(is.numeric , log)


x <- function(x){
   return(x/10)
}

iris %>% mutate_if(is.numeric , x)



