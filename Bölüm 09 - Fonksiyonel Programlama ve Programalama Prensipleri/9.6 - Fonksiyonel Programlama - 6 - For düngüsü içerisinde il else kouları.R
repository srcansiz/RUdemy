

## Fonskiyonel Programalama 
## For döngüsü içerisinde if else koşulları

# Tek ve çift sayı kontrolü
5 %% 2 # tek

10 %% 2 # çift

x <- c(12,14,15,16,18,23,100,23,45,36,75)

for(i in 1:length(x)){

    if( x[i] %% 2 == 0 ){
     cat(i , '. Sonuç : ' , x[i] , '=> bir çift sayıdır ' , '\n')
    }else if(x[i] %% 2 == 1){
      cat(i , '. Sonuç : ' , x[i] , '=> bir tek sayıdır ' , '\n')      
    }else{
      cat('Herhangi bir sonuç yok' , '\n')
    }
    
}





