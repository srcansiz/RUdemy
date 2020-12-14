
list.files('/Users/sergencansiz/Desktop/RTutorial')

df <- read.csv('/Users/sergencansiz/Desktop/RTutorial/CSV__singapore.csv' , 
                header = T , sep = ";" , dec = '.')
View(df)

mean(df$price)

any(is.na(df$price))

mean(df$price , na.rm = T)

sd(df$price , na.rm = T)

median(df$price , na.rm = T)

hist(df$price)
hist(df$price[df$price < 1000])

sd(df$price , na.rm = T) 
var(df$price , na.rm = T)

min(df$price , na.rm = T)
max(df$price , na.rm = T)

table(df$room_type)

which(df$room_type == '110')
df <- df[-964 , ]
table(df$room_type)


class(df$room_type)
levels(df$room_type)

which(df$room_type == "")
df <- df[-which(df$room_type == ""), ]

table(df$room_type)

quantile(df$price)


