

x <- '01/01/2020'
x1 <- '02/01/2020'

y <- as.Date(x , format = "%d/%m/%Y")
y1 <- as.Date(x1 , format = "%d/%m/%Y")


weekdays(y)
weekdays(y1)
months(y)
months(y1)

x2 <- '1 Eylül 2019'
x3 <- '1 September 2019'


as.Date(x3 , format= "%d %B %Y")

sessionInfo()

Sys.setlocale('LC_TIME' , 'tr_TR.UTF-8')
as.Date(x2 , format= "%d %B %Y")


Sys.setlocale('LC_TIME' , 'en_US.UTF-8')



d <- seq(from = as.Date('2012-01-01' , format = '%Y-%m-%d') , 
         to = as.Date('2012-02-29' , format= '%Y-%m-%d'),
         by = 'day')
