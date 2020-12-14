

d1 <- seq(from = as.Date('2012-01-01'), 
          to = as.Date('2012-06-01'),
          by = "month")

d2 <- seq(from = as.Date('2012-02-01'), 
          to = as.Date('2012-07-01'),
          by = "month")

length(d1)
length(d2)

class(d1)
class(d2)

d2 - d1


d2
d1
d2 - d1

d2
d2  - as.Date('2012-02-01')

x <- d2  - as.Date('2012-02-01')

x[0]
x[1]
x[2]
as.double(x)
as.double(x[2])


