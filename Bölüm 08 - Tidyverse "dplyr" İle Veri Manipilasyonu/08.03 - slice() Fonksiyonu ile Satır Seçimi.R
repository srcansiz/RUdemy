
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



