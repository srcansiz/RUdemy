
f <- function(){
    
    x = readline(prompt = "İlk sayısı giriniz : ")
    y = readline(prompt = "İkinci sayısı giriniz : ")
    
    x = as.numeric(x)
    y = as.numeric(y)
    
    d = x + y
    return(d)
  
}


f1 <- function(){
  
    x = readline(prompt = "İlk sayı : ")
    y = readline(prompt = "İkinci sayı : ")
    z = readline(prompt = "Üçüncü sayı : ")
    
    x = as.numeric(x)
    y = as.numeric(y)
    z = as.numeric(z)
    
    ort = (x + y + z)/3
    
    result = paste('3 Sayısının ortalaması ' , ort , 'a eşittir')
    
    return(result)
  
}









