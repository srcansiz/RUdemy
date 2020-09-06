
# While Döngüsü

for(i in 1:50){
  
}

x = 10

while( x > 5 ){
  
  print('Çalışıyor')
  Sys.sleep(1)
  
}

x = 5
l = 1 

while( x < 10){
  
  cat( l , '.Döngü Gerçekleşti' , '\n')
  l = l + 1
  Sys.sleep(3)
}

l = 1 
while( x < 10){
  
  cat( l , '.Döngü Gerçekleşti' , '\n')
  if(l == 6 ) {
     x = 11
  }
  l = l + 1
  Sys.sleep(3)
}

l = 1 
while(TRUE){
  cat( l , '.Döngü Gerçekleşti' , '\n')
  l = l + 1
  Sys.sleep(3)
}


l = 1 
while(TRUE){
  cat( l , '.Döngü Gerçekleşti' , '\n')
  
  if(l == 10){
    break
  }
  
  l = l + 1
  Sys.sleep(1)
}





