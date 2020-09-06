

seq(from = 1 , to = 100 , by = 5)

# Ardışık Tarih

# 1 er gün ara ile artar
seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2020' , format = '%d/%m/%Y') , 
    by = 1)
# 5 er gün ara ile artar
seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2020' , format = '%d/%m/%Y') , 
    by = 5)

# Gün
seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2020' , format = '%d/%m/%Y') , 
    by = 'day')
# Ay
seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2021' , format = '%d/%m/%Y') , 
    by = 'month')

d <- seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2021' , format = '%d/%m/%Y') , 
    by = 'month')

length(d)


# yıl
seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2030' , format = '%d/%m/%Y') , 
    by = 'year')

d <- seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
         to = as.Date('22/12/2030' , format = '%d/%m/%Y') , 
         by = 'year')

length(d)

seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y' ) , 
    to = as.Date('22/12/2030' , format = '%d/%m/%Y') , 
    by = 'quarter')
length(d)

seq(from = as.Date('01/01/2021' , format = '%d/%m/%Y' ) , 
    to = as.Date('01/03/2030' , format = '%d/%m/%Y') , 
    by = 'quarter')
length(d)

seq(from = as.Date('01/01/2021' , format = '%d/%m/%Y' ) , 
    to = as.Date('01/03/2022' , format = '%d/%m/%Y') , 
    by = 'quarter')
length(d)

seq(from = as.Date('01/01/2021' , format = '%d/%m/%Y' ) , 
    to = as.Date('01/03/2022' , format = '%d/%m/%Y') , 
    by = 'quarter')
length(d)


seq(from = as.Date('01/01/2021' , format = '%d/%m/%Y' ) , 
    to = as.Date('01/03/2022' , format = '%d/%m/%Y') , 
    by = 'week')
length(d)


# Zaman İçeren Değer Üzerinde
# 15 Saniye
seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2021 12:45:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 15)

# 1 Dakika
seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2021 12:45:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 60)

# 1 Saat
seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2021 18:30:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 60*60)


seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2021 18:30:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 'hour')

seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2021 18:30:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 'min')

seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2021 12:32:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 'sec')

seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('12/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 'day')

seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/03/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 'month')


seq(from = as.POSIXct('01/01/2021 12:30:00' , format = '%d/%m/%Y %H:%M:%S' ) , 
    to = as.POSIXct('01/01/2022 12:30:00' , format = '%d/%m/%Y %H:%M:%S') , 
    by = 'min')



