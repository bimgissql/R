
install.packages("foreign")

library(foreign)

dbffile <- "C:\\IFCSPACE.DBF"

df <- read.dbf(dbffile, as.is = FALSE)

head(df)

