install.packages("RPostgreSQL")

library(RPostgreSQL)

# connection parameters
host = "127.0.0.1"
port = 5432
dbname = "bimdb"
user = "username"
password = "password"
tbl = "ifc_analysis.pointzdensity"

# connect database
con = dbConnect(drv, host=host, port=port, user=user, password=password, dbname=dbname)

# display connection parameters
summary(con)

# remove password
rm(password) 

tblPointZ=dbGetQuery(con, paste("SELECT * FROM", tbl, sep=" "))

# plot
barplot(tblPointZ$cz
        , names.arg=tblPointZ$zp
        , col="black"
        , xlab="Z coordinate [mm]"
        , ylab="Number of vertices"
        )

# close connection
dbDisconnect(con)

# unload PostgreSQL driver
dbUnloadDriver(drv)


