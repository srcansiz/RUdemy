
standar_s <- function(x  , population = TRUE){
  
      uzunluk = length(x)
      ortalama = sum(x) / uzunluk
      fark_vektor = numeric(uzunluk)
      
      for( i in 1:uzunluk){
          fark_vektor[i] = (x[i] - ortalama)**2 
      }
      
      toplam_fark = sum(fark_vektor)
      
      if(population == TRUE){
        standart_ort = toplam_fark / uzunluk
      }else{
        standart_ort = toplam_fark / (uzunluk - 1)
      }
      
      std = sqrt(standart_ort)
      
      return(std)
}

v <- c(9, 12,34,23,12,15,16)

standar_s(v)
standar_s(v , population = TRUE)
standar_s(v , population = FALSE)

sd(v)
