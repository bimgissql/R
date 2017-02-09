library(RPostgreSQL)

# connection parameters
host = "127.0.0.1"
port = 5432
dbname = "bimdb"
user = "username"
password = "password"

# IFC tables
tblBuilding = "ifc.building"
tblBuildingStorey = "ifc.buildingstorey"
tblBuildingSpace = "ifc.space"

# connect database
con = dbConnect(drv, host=host, port=port, user=user, password=password, dbname=dbname)

# display connection parameters
summary(con)

# remove password
rm(password) 

buildingCount <- dbGetQuery(con, paste("SELECT COUNT(*) FROM", tblBuilding, sep=" "))
storeyCount <- dbGetQuery(con, paste("SELECT COUNT(*) FROM", tblBuildingStorey, sep=" "))
spaceCount <- dbGetQuery(con, paste("SELECT COUNT(*) FROM", tblBuildingSpace, sep=" "))

# print model statistics
print("Number of buildings in current IFC model: ", buildingCount)
print("Number of storeys in current IFC model  : ", storeyCount)
print("Number of spaces in current IFC model   : ", spaceCount)

# close connection
dbDisconnect(con)

# unload PostgreSQL driver
dbUnloadDriver(drv)
