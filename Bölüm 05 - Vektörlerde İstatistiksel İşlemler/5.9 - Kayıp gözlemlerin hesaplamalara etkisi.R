

x <- c(12,13,14,15,NA)

sum(x)

sum(x , na.rm = T)
mean(x)
mean(x , na.rm = T)
sd(x , na.rm = T)
median(x , na.rm = T)


is.na(x)

which(is.na(x))

y <- c(12,13,14,15,NA,NA,14,1,15,NA)

which(is.na(y))

any(is.na(y))

t <- c(1,2,3,4,5)
any(is.na(t))


mean(x , na.rm = any(is.na(y)))
mean(t , na.rm = any(is.na(t)))


n <- which(is.na(y))
y[n]

y[n] <- 0

y


y <- c(12,13,14,15,NA,NA,14,1,15,NA)
y[is.na(y)]
y[is.na(y)] <- 0
y


