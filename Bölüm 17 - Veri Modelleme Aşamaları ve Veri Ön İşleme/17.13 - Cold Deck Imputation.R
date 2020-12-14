## Cold Deck Imputatiion

df <- student_placement_data_with_NA
View(df)

index <- which(is.na(df$percentage.in.Algorithms))
index
length(index)

# certifications
# workshops

index[1]
names(df)

df[c("certifications" , "workshops")][index[1] , ]

d <- subset(df , 
       select = c("percentage.in.Algorithms" , "certifications" , "workshops"),
       subset = ( certifications == "python" & workshops == "data science" ) )


ort <- mean(d$percentage.in.Algorithms , na.rm = T)
ort

df$percentage.in.Algorithms[index[1]] <- ort

df$percentage.in.Algorithms[31]



