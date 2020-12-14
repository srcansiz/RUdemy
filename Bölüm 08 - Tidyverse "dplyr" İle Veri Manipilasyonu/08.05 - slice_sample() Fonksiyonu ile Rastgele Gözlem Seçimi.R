
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



