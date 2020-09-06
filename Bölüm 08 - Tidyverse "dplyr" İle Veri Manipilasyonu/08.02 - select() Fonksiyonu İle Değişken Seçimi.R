
### Tidyverse ###########3


### Tidyverse yükleme işlemi
install.packages("tidyverse")
library(tidyverse)

# data_new <- data %>% select(v1) %>% filter(v1 > 5)


### Select() Fonksiyonu İle Değişken Seçimi 

View(iris)

iris_new <- iris %>% select(Sepal.Length , Sepal.Width)
View(iris_new)




