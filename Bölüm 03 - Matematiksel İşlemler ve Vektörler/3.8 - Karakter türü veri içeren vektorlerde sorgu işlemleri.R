
'A' == 'A'
'B' == 'A'

'Bb' == 'BB'

'B' != 'B'
'B' != 'A'

'B' < 'A'
'B' > 'A'

'B' >= 'A'
'B' >= 'B'

'B' <= 'B'
'B' <= 'A'

'Ad' < 'Ar'
'Bd' < 'Ad'

'BD' < 'BD'
'Bd' < 'BD'
'BD' < 'Bd'

'd' < 'D'
'D' > 'd'
'D' < 'd'

x <- c('A' , 'B' , 'C' , 'D' , 'A' , 'F' , 'Y')

x[x > 'X']
x[x > 'D']
x[x >= 'D']

which(x > 'D')
which(x == 'A')

x[which(x == 'A')]


'Sergen' < 'Ahmet'
'Sergen' < 'Serkan'

'SeRgen' < 'Serkan'
'Serkan' < 'SeRgen'
'Sergen' < 'SeRgen'
'SeRgen' < 'Sergen'
