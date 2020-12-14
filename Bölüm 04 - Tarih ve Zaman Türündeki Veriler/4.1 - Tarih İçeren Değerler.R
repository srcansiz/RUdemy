# %d - day as a number (0-31)	01-31
# %a - abbreviated weekday Mon
# %A - unabbreviated weekday Monday
# %m - month (00-12)	00-12
# %b - abbreviated month Jan
# %B - unabbreviated month January	
# %y - 2-digit year  07
# %Y - 4-digit year	 2007


Sys.Date()

today <- Sys.Date()
today
class(today)


format(today , format = "%d/%m/%Y")
g <- format(today , format = "%d/%m/%Y")
class(g)

tarih <- '06/06/2016'
class(tarih)

as.Date(tarih , format = '%d/%m/%Y')
yeniTarih <- as.Date(tarih , format = '%d/%m/%Y')
class(yeniTarih)


as.Date(g , format = "%d/%m/%Y")
today <- as.Date(g , format = "%d/%m/%Y") 
class(today)

tarih2 <- '23-05-2020'
class(tarih2)
as.Date(tarih2 , format = '%d-%m-%Y')

