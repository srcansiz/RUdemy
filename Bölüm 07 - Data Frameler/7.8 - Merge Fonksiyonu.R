

merge_df = merge(Demografik , Transactions , 
                by.x = "ID" , by.y = "CUSTOMER_ID")

View(merge_df)


names(Transactions)
names(Transactions)[2] <- 'ID'
names(Transactions)

merge_df2 <- merge(Demografik , Transactions , by = 'ID')
View(merge_df2)
# Help 
?merge
