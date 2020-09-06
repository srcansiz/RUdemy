
Sys.Date() # Tarih
Sys.time() # Tarih ve Zaman


t1 <- Sys.time()
t1

class(t1) # Tarih Zaman formatları

t1
t1 <- as.POSIXct(t1)
class(t1)
unclass(t1)

t1l <- as.POSIXlt(t1)
t1l
unclass(t1l)

unct1l <- unclass(t1l)
unct1l

names(unct1l)

unct1l[['min']]
unct1l[['sec']]
unct1l[['mday']]
unct1l[['year']] + 1900
unct1l[['mon']] + 1


t2 <- '12/12/1920 18:30:23'
t2
class(t2)

tv2 <- as.POSIXlt(t2 , format = "%d/%m/%Y %H:%M:%S" , tz = "UTC")
tv2
t2
tv2c <- unclass(tv2)


tv2c[['min']]
tv2c[['sec']]
tv2c[['mday']]
tv2c[['year']] + 1900
tv2c[['mon']] + 1

t3 <- '12/12/1840 18:30:23'
t3
class(t3)

tv3 <- as.POSIXlt(t3 , format = "%d/%m/%Y %H:%M:%S" , tz = "UTC")

tv3c <- unclass(tv3)

tv3c[['min']]
tv3c[['sec']]
tv3c[['mday']]
tv3c[['year']] + 1900
tv3c[['mon']] + 1

tv3c[['year']]



