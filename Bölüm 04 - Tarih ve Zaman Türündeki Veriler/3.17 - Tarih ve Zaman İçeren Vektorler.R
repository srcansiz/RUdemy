
as.Date()
as.POSIXct()
as.POSIXlt()

d <- '12/12/2012'

d2 <- c('12/12/2012' , '13/12/2012' , '14/12/2012' )
d2
class(d2)

d2 <- as.Date(d2  , format = "%d/%m/%Y")
class(d2)
d2

d3 <- c('12-12-2012' , '13-12-2012' , '14-12-2012' )
class(d3)
d3
d3 <- rep(d3 , times = 5)
d3 <- rep(d3 , each = 3)
d3
length(d3)

d3 <- as.Date(d3 , format = "%d-%m-%Y")
class(d3)

# Tarih ve Zaman içeren değerler
d4 <- c('12-12-2012 12:12:01' , '13-12-2012 12:12:01' , '14-12-2012 12:12:01' )
d4
class(d4)

d4 <- as.POSIXlt(d4 , format = "%d-%m-%Y %H:%M:%S" , tz = "UTC")
d4
class(d4)

d4un <- unclass(d4)
d4un[['sec']][3]

d4un[['year']][2]
d4un[['year']][2] + 1900

