"This is connecting to a mySql DB"

library("RMySQL")

ucscDb <- dbConnect(MySQL(),user="genome",
                   host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;");
dbDisconnect(ucscDb)
result
"The result is all the databases"

#We're interested in hg19
hg19 <- dbConnect(MySQL(), user="genome", db = "hg19",
                  host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

#Getting dimensions of a table takes us to get fields form a table
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#Returning the data we want
affyData <- dbReadTable(hg19, "affyU133Plus2")

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
#You need to clear your queries when you're done
dbDisconnect(hg19)

"HDF5 databases"
#This is useful for downloading tons of large;
#hierarchical data sets.

"Reading Data from the Web"
#This is good web scraping etc.
# getting open a connection
con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
#reading lines
htmlCode = readLines(con)
# but this is kind of annoying, so we can move it to read in XML

library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes = TRUE)
close(con)

#Or using the get Comand