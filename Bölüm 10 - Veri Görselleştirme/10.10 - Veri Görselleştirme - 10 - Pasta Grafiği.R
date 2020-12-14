
View(mtcars)

table(mtcars$gear)
yuz <- prop.table(table(mtcars$gear))
yuz
names = c("3 Vitesli" , "4 Vitesli" , "5 Vitesli")

t <- sprintf("%s = %s%3.1f" ,  names , "%" ,as.numeric(yuz)*100  ) 

pie(yuz , 
    main = "Viteslerin Pasta Graği" , 
    labels = t,
    col = c("orange" , "pink" , "cyan"),
    init.angle = 180,
    border = "black",
    lty  = 4,
    radius = 1
    )



