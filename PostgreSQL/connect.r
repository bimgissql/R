install.packages("RPostgreSQL")

require("RPostgreSQL")

library(RPostgreSQL)

# open connection

# load PostgreSQL driver
drv = dbDriver("PostgreSQL")

# connection parameters
host = "192.168.55.101"
port = 5432
dbname = "bim"
user = "username"
password = "password"
tbl = "ifc.cartesianpoint"

# connect database
con = dbConnect(drv, host=host, port=port, user=user, password=password, dbname=dbname)

# display connection parameters
summary(con)

# remove password
rm(password) 

# check for table
dbExistsTable(con, tbl)

#
#
#
tblCartesianPoint=dbGetQuery(con, paste("SELECT * FROM", tbl, sep=" "))

minx = min(tblCartesianPoint$x, ns.rm = TRUE)
meanx = mean(tblCartesianPoint$x, ns.rm = TRUE)
minz = min(tblCartesianPoint$z, ns.rm = TRUE)
maxz = max(tblCartesianPoint$z, ns.rm = TRUE)
medz = median(tblCartesianPoint$z)


# destructor
# close connection
dbDisconnect(con)
dbUnloadDriver(drv)



