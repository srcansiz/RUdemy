
df <- CSV__singapore
View(df)
names(df)

df$id
df["id"]

attach(df)
host_name
host_id
class(host_id)

detach(df)
host_id

detach(df)
detach(df)
host_id

with(df , print(host_name) )


with(df , {
        x <- mean(price , na.rm = T)
        y <- x - 5 
        print(y)
})


