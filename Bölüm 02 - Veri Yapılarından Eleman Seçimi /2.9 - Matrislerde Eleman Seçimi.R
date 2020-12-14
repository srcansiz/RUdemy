
# Matris oluşturma
m <- matrix(c(11,12,13,14) , nrow = 2 , ncol=2 , byrow = TRUE)


# Matrislerde seçim

m1 <- matrix(c(12,22,34,45,45,56,57,68) , nrow=2 , ncol=4 , byrow=TRUE)

m1

# [1,] [,1] = [1,1]
# Birinci satır ve birinci sütun

m1[1,1]
m1[2,4]
m1[2,5]

# Matrisin parçalarını seçmek

m1[c(1,2) , c(1,2)]
class(m1[c(1,2) , c(1,2)])

m1[1:2,2:4]
m1[c(1) , c(1,3,4)]



