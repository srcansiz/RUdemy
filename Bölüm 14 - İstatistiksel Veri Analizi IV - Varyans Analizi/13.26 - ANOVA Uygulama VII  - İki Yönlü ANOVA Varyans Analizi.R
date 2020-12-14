library(tidyverse)
library(rstatix)


### Iki Yönlü Varyans Analizi 

df <- heart %>% filter(chol < 400)

df %>% group_by(cp , fbs ) %>% summarise(Shapiro = shapiro.test(chol)$p.value )

bartlett.test(df$chol ~ interaction(df$cp , df$fbs))


anova_1 <- aov(df$chol ~ as.factor(df$cp) *  as.factor(df$fbs))
summary(anova_1)


anova_test(df , dv = chol , between = c(cp , fbs))

anova_1 <- aov(df$trestbps ~ as.factor(df$cp) *  as.factor(df$fbs))
summary(anova_1)

anova_test(df , dv = trestbps , between = c(cp , fbs))

