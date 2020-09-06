

d <- seq(from = strptime('2012-01-01 12:00:00' , format = '%Y-%m-%d %H:%M:%S'),
         to = strptime('2012-01-30 12:30:00' , format = '%Y-%m-%d %H:%M:%S'),
         by = 'day')
d
class(d)
tarih <- format(d , format = '%Y-%m-%d')
tarih
class(tarih)

zaman <- format(d , format = '%H:%M:%S')
zaman
class(zaman)


df <- data.frame('Tarih' = tarih , 'Zaman' = zaman)
df

class(df$Tarih)

class(as.Date(df$Tarih))

as.POSIXct(df$Zaman , format = '%H:%M:%S')

df

?dates

dates(df$Tarih , format = 'y-m-d')

dates(as.character(df$Tarih) , format = 'y-m-d' )
times(as.character(df$Zaman) , format = 'h:m:s')

df$Tarih <- dates(as.character(df$Tarih) , format = 'y-m-d' )
df$Zaman <- times(as.character(df$Zaman) , format = 'h:m:s')


df

class(df$Tarih)
class(df$Zaman)


df$Zaman[1] - df$Zaman[2] 
df$Tarih[2] - df$Tarih[1]

