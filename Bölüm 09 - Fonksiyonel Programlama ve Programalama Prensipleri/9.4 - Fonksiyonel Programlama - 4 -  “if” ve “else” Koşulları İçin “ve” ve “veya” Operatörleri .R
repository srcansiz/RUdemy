
if(5 == 4){
  print('DOğru')
}else{
  print('Yanlış')
}

View(iris)

if(mean(iris$Sepal.Length) > 4 & median(iris$Sepal.Width) > 4){
  print('Koşullar sağlandı')
}else{
  print('Koşullar sağlanmadı')
}

mean(iris$Sepal.Length)
median(iris$Sepal.Width)

if(mean(iris$Sepal.Length) > 4 | median(iris$Sepal.Width) > 4){
  print('Koşullar sağlandı')
}else{
  print('Koşullar sağlanmadı')
}

if(mean(iris$Sepal.Length) < 4){
    
  print('İlk if kosulları saglandı')
  
}else if(mean(iris$Sepal.Length) < 6){
  
  print('İkinci if kosulları saglandı')
  
}


if(mean(iris$Sepal.Length) < 4){
  
  print('İlk if kosulları saglandı')
  
}else if(mean(iris$Sepal.Length) < 5){
  
  print('İkinci if kosulları saglandı')
  
}else{
  
  print('Hiç bir kosul sağlanmadı')
}

x = c(12,14,15,16,17,12,13,18,90)

if(length(x) < 10 & median(x) > 5){
     cat('Vektörün ortalama değeri ' , mean(x) , ' olarak tespit edildi' )
}else{
     cat('X değişkeni için kosullar saglanmadı')
}

if((length(x) > 10 & median(x) > 5) | (length(x) < 10 & mean(x) > 5) ){
  cat('Vektörün ortalama değeri ' , mean(x) , ' olarak tespit edildi' )
}

