
d <- seq(from = as.Date('2012-01-01') , 
         to = as.Date('2020-01-01') , 
         by = 'month')

# Ay olarak artan vektor
d

x <- c(1,2,3,4)
x > 2
x[x>2]

# Tanımlı Format
d[d > '2019-05-01']

# Tanımsız format as.Date() kullanılmalı
d[d > as.Date('01/01/2019' , format = "%d/%m/%Y")]

which(d > as.Date('01/01/2019' , format = "%d/%m/%Y"))
inx <- which(d > as.Date('01/01/2019' , format = "%d/%m/%Y"))
d[inx]


dt <- seq(from = as.POSIXct('2012-01-01 12:00:00') , 
          to = as.POSIXct('2012-01-01 12:45:00') , 
          by = 'min')
dt
class(dt)


dt > '2012-01-01 12:30:00'
dt[dt > '2012-01-01 12:30:00']
which(dt > '2012-01-01 12:30:00')


dt < '2012-01-01 12:30:00'
dt[dt < '2012-01-01 12:30:00']
which(dt < '2012-01-01 12:30:00')


dt <= '2012-01-01 12:30:00'
dt[dt <= '2012-01-01 12:30:00']
which(dt <= '2012-01-01 12:30:00')


dt == '2012-01-01 12:30:00'
dt[dt == '2012-01-01 12:30:00']
which(dt == '2012-01-01 12:30:00')


dt < '2012-01-01 12:30:30'
dt[dt < '2012-01-01 12:30:30']
which(dt < '2012-01-01 12:30:30')


dt > '2012-01-01 12:30:30'
dt[dt > '2012-01-01 12:30:30']
which(dt > '2012-01-01 12:30:30')

dt > as.POSIXct('01//01//2012 12:30:30' , format = '%d//%m//%Y %H:%M:%S')
dt[dt > as.POSIXct('01//01//2012 12:30:30' , format = '%d//%m//%Y %H:%M:%S')]
which(dt > as.POSIXct('01//01//2012 12:30:30' , format = '%d//%m//%Y %H:%M:%S'))


