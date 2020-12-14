
list.files('/Users/sergencansiz/Desktop/RTutorial')

df <- read.csv('/Users/sergencansiz/Desktop/RTutorial/CSV__singapore.csv' , 
               header = T , sep = ";" , dec = ".")
View(df)

class(df$name)

df$name <- as.character(df$name)
class(df$name)

df['name']
class(df['name'])

# Hatalı kullanım 
cv <- as.character(df['name'])
cv[1]


df[,c('name')]

class(df[, c('name')])

as.factor(df[, c('name')])
df[,c('name')] <- as.factor(df[,c('name')])
class(df[, c('name')])

df[,c('name')] <- as.character(df[,c('name')])
class(df[, c('name')])


class(df$id)

# Yanlış çevirme işlemi
x <- df$id
class(x)
as.numeric(x)

df$id <- as.character(df$id)
class(df$id)

df$id <- as.numeric(df$id)
df$id

df$id <- as.integer(df$id)
class(df$id)

any(is.na(df$id))


class(df$host_id)

df$host_id <- as.character(df$host_id)
df$host_id <- as.integer(df$host_id)


class(df$room_type)
df$room_type <- as.character(df$room_type)
table(df$room_type)

inds <- which( df$room_type == '' | df$room_type == '110' | 
         df$room_type == '1200' | df$room_type == '294' | 
         df$room_type == '31' | df$room_type == '40' | 
         df$room_type == '50' | df$room_type == '60' | 
         df$room_type == '74' | df$room_type == '75' | 
         df$room_type == '750' )

df <- df[-inds , ]


table(df$room_type)
