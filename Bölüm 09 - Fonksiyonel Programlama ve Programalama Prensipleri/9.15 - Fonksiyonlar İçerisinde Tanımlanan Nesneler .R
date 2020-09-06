
f1 <- function(){
  
      x = 5 
      y = 10
      z = 12
      
      return(x + y + z)
}



f2 <- function(){
  
    x <- 5
    y <- 10
    z <- 12
  
    return(x + y + z)    
    
} 


f2()


f3 <- function(){
  
    x <<- 5
    y <<- 10
    z <<- 12
    
    return(x + y + z)
}

f3()


x 
y
z

f4 <- function(x , y){
  
      return(x + y)
}

f4(4 , 5 )

f4( x = 4 , y = 5)
f4(x = 6 , t = 5) # Hatalı

f4( x <- 4 , y <- 5)

f4( x = 5 , y = 9)

x = 15

f5 <- function(){
    
    x = 20
    y = 5
    
    return(x + y)
}

f5()
x

x = 15

f6 <- function(){
    
   x <<- 20
   y <<- 24
   
   return(x + y)
}

f6()
x
