#install.packages("ggplot2")
#install.packages("ggpubr")

library(ggpubr)
library(tidyverse)
library(rstatix)


final <- DesignTest %>% gather(key = "Groups" , value = "Scores" , 
                      ADesign , BDesign , CDesign) %>%
                      convert_as_factor(Groups)
View(final)

ggboxplot(final , x = "Groups" , y = "Scores" , color = "orange")

?ggboxplot

ids <- c(rep(seq(1, 100) , 3))
final$wid = ids
anova_test(final , dv = "Scores" , within = "Groups" , wid = "wid")



