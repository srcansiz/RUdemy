
View(iris)

f1 <- function(data){
  
    baslangic <- 1 
    son <- nrow(data)
    
    ortalama <- mean(data[,3] , na.rm = T)
  
    result <- list()
    
    result[['k']] <- numeric()
    result[['b']] <- numeric()
    
    while(TRUE){
      
      if(data[baslangic , 3] < ortalama){
         d = (data[baslangic , 1] * data[baslangic , 2]) / data[baslangic , 4]
         result[['k']] <- append(result[['k']] , d)   
      }else{
         d = data[baslangic , 1] * data[baslangic , 2] * data[baslangic , 4]
         result[['b']] <- append(result[['b']] , d) 
      } 
      
      baslangic = baslangic + 1
      
      if(baslangic == son){
        break
      }
      
    }
    
    return(result)
  
  
}


f1(iris)

result <- f1(iris)

result
class(result)
