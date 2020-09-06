library(tidyverse)
library(rstatix)

# install.packages("mvnormtest")
library(mvnormtest)

heart %>% group_by(cp) %>% 
          summarise(ShapiroResult = mshapiro_test(cbind(chol,thalach) )$p.value )

?identify_outliers
identify_outliers(heart["chol"])
identify_outliers(heart["thalach"])
quantile(heart$thalach)

heart <- heart %>% filter( chol < 394 & thalach > 71)


heart %>% group_by(cp) %>% 
  summarise(ShapiroResult = mshapiro_test(cbind(chol,thalach) )$p.value )


### Çok Değişkenli Varyans Homojenliği Testleri 

install.packages("heplots")
library(heplots)

bartlettTests()
leveneTests()

?bartlettTests


bartlettTests(y = heart[c("chol" , "thalach")] , group = heart$cp )
leveneTests(y = heart[c("chol" , "thalach")] , group = heart$cp )

leveneTest(heart$chol , heart$cp)


## Kovaryans matrislerinin homojenliği 

?box_m

cov(heart$chol , heart$thalach)

box_m(heart[c("chol" , "thalach")] , group = heart$cp)

# Ho : Kovaryans matrisleri homojendir 
# Ha : Kovaryans matrisleri homojen değildir. 

?manova


model <- manova( cbind(chol , thalach) ~ cp , data = heart )
summary(model)

# Önemli
library(car)

model2  <- lm(cbind(chol , thalach) ~ cp , data = heart)

Manova(model2 , test.statistic = "Pillai")

?Manova

### POST HOC Testleri 

View(heart)
library(tidyverse)
library(rstatix)

grouped_heart = heart %>% gather( key = "variable" , value = "values" , thalach , chol) %>%
          group_by(variable) 

## Welch Anova Test
grouped_heart %>% convert_as_factor(cp) %>% 
                  welch_anova_test(values ~ cp)

## TukeyHSD Test

grouped_heart %>% convert_as_factor(cp) %>% 
                tukey_hsd(values ~ cp)

## Games-Howell Test

grouped_heart %>% convert_as_factor(cp) %>% 
            games_howell_test(values ~ cp)
