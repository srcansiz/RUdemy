
for(k in 1:10){
  
  for(l in 1:10){
    cat(k , '. k Döngüsü' , l , '. l döngüsü' , '\n')
    Sys.sleep(1)
  }
  
}

View(iris)

for(i in 1:nrow(iris)){
  
  for(k in 1:length(iris)){
  
      text <- paste(names(iris)[k], 'Değişkeninin' , 
                    i , '. satır değeri => ' , 
                    iris[i,k] , ' eşittir'  )
      print(text)
      Sys.sleep(1)
  }
}

# While Döngüsünün İÇinde For Döngüsü


while(TRUE){
  
  print('Yeni while döngüsü başladı')
  for(i in 1:5){
    print(i)
    
    Sys.sleep(1)
  }
  
  
  Sys.sleep(3)
}











