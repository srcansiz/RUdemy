
read.csv('')

getwd()
setwd("/Users/sergencansiz/Desktop/")
getwd()

list.files()

# C:/Users/sergen/Desktop/
setwd("/Users/sergencansiz/Desktop/RTutorial")
getwd()

list.files()

df <- read.csv('CSV__singapore.csv' , header = TRUE , sep = ";" , dec = ".")
View(df)


df2 <- read.csv('CSV__singapore.csv' , header = TRUE , sep = "," , dec = ".")
View(df2)

getwd()
setwd("/Users/sergencansiz/Desktop/")
getwd()

df <- read.csv('RTutorial/CSV__singapore.csv' , header = TRUE , sep = ";" , dec = ".")
View(df)

