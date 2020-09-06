

d1 <- '12/12/2020'
d2 <- '13/12/2020'

class(d1)

d1 <- as.Date(d1 , format = '%d/%m/%Y')
d1
class(d1)
d2 <- as.Date(d2 , format = '%d/%m/%Y')
d2
class(d2)

d2 - d1
d1 - d2
class(d1 - d2)

as.double(d2 - d1)


d3 <- '12/12/2020'
d4 <- '20/12/2020'
d3 <- as.Date(d3 , format = '%d/%m/%Y')
d4 <- as.Date(d4 , format = '%d/%m/%Y')

as.double(d4-d3)

d5 <- '12/12/2020'
d6 <- '12/12/2021'
d5 <- as.Date(d5 , format = '%d/%m/%Y')
d6 <- as.Date(d6 , format = '%d/%m/%Y')

as.double(d6-d5)


d7 <- '12/12/2020'
d8 <- '28/12/2021'
d7 <- as.Date(d7 , format = '%d/%m/%Y')
d8 <- as.Date(d8 , format = '%d/%m/%Y')

as.double(d8-d7)



d1t <- '12/12/2020 12:30:00'
d2t <- '12/12/2020 12:45:00'
d1t <- as.POSIXlt(d1t , format = '%d/%m/%Y %H:%M:%S')
d2t <- as.POSIXlt(d2t , format = '%d/%m/%Y %H:%M:%S')

d1t
d2t
d2t - d1t
as.double(d2t-d1t)


d3t <- '12/12/2020 12:30:00'
d4t <- '13/12/2020 12:45:00'
d3t <- as.POSIXlt(d3t , format = '%d/%m/%Y %H:%M:%S')
d4t <- as.POSIXlt(d4t , format = '%d/%m/%Y %H:%M:%S')

d3t
d4t
d4t - d3t
as.double(d4t-d3t)


d5t <- '12/12/2020 12:30:00'
d6t <- '12/12/2020 13:45:00'
d5t <- as.POSIXlt(d5t , format = '%d/%m/%Y %H:%M:%S')
d6t <- as.POSIXlt(d6t , format = '%d/%m/%Y %H:%M:%S')

d5t
d6t
d6t - d5t
as.double(d6t-d5t)
