
for(i in 1:10){
  
    print(i)
  
}


x <- c(12,14,15,17,18)

for(i in x){
   print(i)
}
for(i in 1:length(x)){
  
  print(x[i])
  
}

for(i in length(x):1){
    
  print(x[i])
  
}

View(iris)

for(i in 1:nrow(iris)){
    print(iris$Species[i])
}

y <- c('A', 'B' , 'C' , 'D')
pas <- ''
for(u in 1:length(y)){
  
    pas = paste(pas , ' - ' , y[u])
  
}
pas



