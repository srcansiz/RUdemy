

f1 <- function(x){
  
      if( x %% 2 == 0){
        
         # X'in karesi
         return(x**2)  
        
      }else if(x %% 3 == 0){
        
         # X'in küpü 
        return(x**3)
          
      }else{
        
        # Sıfır dönsün
        return(0)
        
      }
    
  
}

f1(15)
f1(12)
f1(4)
f1(x = 5)


f2 <- function(x , y){
    
    if( x > y){
       r = x + y
    }else{
       r = 0
    }
  
    if(x < 10){
      r1 = x - y
    }else{
      r1 = 0 
    }
  
    return(r - r1)
}

f2(x = 5 , y = 10)
f2(x = 11 , y = 3)




f3 <- function(x , y){
  
  r  = 0 
  r1 = 0 
  
  if( x > y ){
    r = x + y
  }
  
  if(x < 10){
    r1 = x - y
  }
  
  return(r - r1)
}

f3(x = 5 , y = 10)
f3(x = 11 , y = 3)



