
install.packages('chron')
library(chron)

?chron



x <- '01/01/2020'
y <- '01/02/2020'

d <- c(x,y)
d
class(d)

d <- chron(dates. = d , format = "d/m/y")
class(d)



x <- '01/01/2020'
y <- '01/02/2020'

xt <- '12:00:00'
yt <- '12:30:00'

d <- c(x,y)
dt <- c(xt ,yt)
class(d)
class(dt)


d <- chron(dates. = d , times. = dt ,  format = c(dates = 'd/m/y' , times = 'h:m:s'))
class(d)
d
d[1]


