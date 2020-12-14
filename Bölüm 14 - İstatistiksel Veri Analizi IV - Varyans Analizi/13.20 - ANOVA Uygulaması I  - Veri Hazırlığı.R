# install.packages("tidyverse")
# install.packages("rstatix")

library(tidyverse)
library(rstatix)


?identify_outliers


outliers <- identify_outliers(heart["chol"])
outliers

df <- heart %>% filter(chol < 407)

max(df$chol)


df_new <- df %>% group_by( 
  age_groups = cut( age , breaks = seq(min(age)-1 , max(age) + 1 , length.out = 4) )
  )
View(df_new)

levels(df_new$age_groups)


