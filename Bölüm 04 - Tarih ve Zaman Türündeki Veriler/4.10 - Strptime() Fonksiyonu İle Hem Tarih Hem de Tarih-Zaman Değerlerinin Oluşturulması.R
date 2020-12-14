
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/strptime


x <- '2012-01-01'
y <- '01/01/2020'

x1 <- strptime(x , format = '%Y-%m-%d')
x2 <- strptime(y , format = '%d/%m/%Y')

x1
x2

class(x1)
class(x2)

x <- '2012-01-01 12:00:00'
y <- '01/01/2020 12:00:00'

x1 <- strptime(x , format = '%Y-%m-%d %H:%M:%S' , tz = "GMT")
x2 <- strptime(y , format = '%d/%m/%Y %H:%M:%S' , tz = "GMT")


class(x1)
x1
class(x2)
x2
