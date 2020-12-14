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


df_new_1 <- df_new %>% select(age_groups , chol)
View(df_new_1)

# Normallik varsayımı 
df_new_1 %>% 
          group_by(age_groups) %>% 
          summarise(ShapiroResults = shapiro.test(chol)$p.value )


# Varyans homojenliği varsayımı 


bartlett.test(df_new_1$chol ~ df_new_1$age_groups)

library(car)
leveneTest(df_new_1$chol ~ df_new_1$age_groups)

