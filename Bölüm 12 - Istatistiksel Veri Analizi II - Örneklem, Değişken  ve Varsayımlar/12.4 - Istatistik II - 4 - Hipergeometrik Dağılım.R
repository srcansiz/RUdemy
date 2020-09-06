

# Hypergeometric Dağılım

?dhyper

dhyper(x = 4 , m = 26 , n = 26 , k = 10)
dhyper(x = 3 , m = 26 , n = 26 , k = 10)
dhyper(x = 2 , m = 26 , n = 26 , k = 10)
dhyper(x = 11 , m = 26 , n = 26 , k = 10)


plot(1:26 , dhyper(x = 1:26  , m = 26 , n = 26, k = 10 ) ,
           bty = "L" , 
           pch = 19 ,
           col = "orange")
lines( dhyper(x = 1:26 , m = 40 , n = 12 , k = 15) )



phyper(q = 6 , m = 10 , n = 30 , k = 15 , lower.tail = TRUE)
phyper(q = 2 , m = 10 , n = 30 , k = 15 , lower.tail = TRUE)

phyper(q = 2 , m = 10 , n = 30 , k = 15 , lower.tail = FALSE)




####

#### 



## Örnek; 

### Erkek kıyafeti üzerine Instagram sosyal medyasında bir reklam 
### verilmesi planlanmaktadır. Reklam sadece Şişli semtinde
### oturan, cinsiyeti erkek ve 20 ile 25 yaş arasındaki kullanıcalara
### gösterilecek şekilde ayarlanmıştır. Bu kriterli sağlayan toplam 10000
### kişinin instagramda kayıtlı olduğu bilgisi verilmiştir. 10000 kişi içerisinden
### 5000 kişinin google arama verilerine göre yeni sezon kıyafetlerine  
### ihtiyacı olacağı beklenmektedir. Instagram anlaşımasına göre
### reklam sadece 10000 kişi içerisinde 3000 kişiye yanlızca bir 
### kere gösterilecektir. Bu durumda bu reklamın kıyafet ihtiyacı
### olan en az 1500 kişiye gösterilme olasılığı nedir? 

phyper(q = 999 , m = 5000, n = 5000, k = 3000 , lower.tail = TRUE  )



## Olasılık değerine elde edilecek durum sayısı

qhyper( p = 0.6 , m = 5000 , n = 5000 , k = 3000 , lower.tail = TRUE)
qhyper( p = 0.6 , m = 5000 , n = 5000 , k = 3000 , lower.tail = FALSE)
qhyper( p = 0.9 , m = 5000 , n = 5000 , k = 3000 , lower.tail = FALSE)



# Rastgele Veri Üretimi 

rhyper(nn = 50 , m = 26 , n = 26, k = 10)
rhyper(nn = 50 , m = 40 , n = 12, k = 15)

