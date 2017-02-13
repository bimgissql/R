# 
# Moran's test for spatial autocorrelation using a spatial weights matrix
#

# load PostgreSQL library
library(RPostgreSQL)

# connection parameters
host = "127.0.0.1"
port = 5432
dbname = "bimdb"
user = "username"
password = "password"

# IFC tables
tblSpaceGeometries = "ifc.spacegeometries"

# connect database
con = dbConnect(drv, host=host, port=port, user=user, password=password, dbname=dbname)

# display connection parameters
summary(con)

# remove password
rm(password) 

# id of floor to perform Moran's test
floorid <- '100'

# table of space centroids
tblCentroids <- dbGetQuery(con, paste("SELECT id, ST_X(ST_Centroid(spacegeometry)) AS x, ST_Y(ST_Centroid(spacegeometry)) AS y, noiseratio FROM", tblSpaceGeometries, 'WHERE floorid =', floorid, sep=" "))

# distance matrix
tblCentroids.dists <- as.matrix(dist(tblCentroids$x, tblCentroids$y))

# inverted distance matrix
tblCentroids.dists.inv <- 1/tblCentroids.dists

# set diagonal to zero
diag(tblCentroids.dists.inv) <- 0

# calculate global Moran statistics
moran.test(tblCentroids$noiseratio, tblCentroids.dists.inv)

# close connection
dbDisconnect(con)

# unload PostgreSQL driver
dbUnloadDriver(drv)