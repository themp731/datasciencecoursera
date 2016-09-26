"Raw vs. Processed Data"
#For example blood pressure is processed
#Because Blood pressure is actually a measurement of a ratio of certain measurements

#On processing type is sequencing DNA
#a FastQ File that's a text file of DNA
#Each is an that shows the amount of each part of a DNA that then shows a sequence

#When you go from raw to tidy you should have
# A Raw Set -> a Tidy Set -> How you got there -> a description of all the variables

# For this project we consider raw files the lowest level stuff we get
#Things are 'raw' for you if you ran now software on your own and didn't change anything

#Want it so that each variable is in its own column, observations in different rows.
#Different tables for different 'kinds' of varibales.
#Also allow an ID column to merge tables.
#Include Variable names that are readable

#Instruction list, make sure that you make a script if you can so you it shows how things are taken down.

"READING FILES"
#getwd and setwd help get our director
#file.exists will check if there is eomthing there
#dir.create creates a new directory

#download.file is good for downloading things from the internet
#We're going to use baltimore stuff
#Make sure we keep track of the date we're downloading things
#rememember to use method of 'curl' under https

"Reading Local Files"
#flat files are csv's etc. and or tables without multiple levels
#setting parameters is helpful

"Reading Excel Files"
#xlsx is a good libary to load
#library(xlsx)
#cameraData <- read.xlsx(".data/camera.xlsx", sheetIndex = 1)
#You can look through certain tabs and rows with the xlsx

"Getting through XML"
#Tags are labels for each section
#Elements are specific examples of tags
#Attributes are the components of the label
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

fileUrl2 <- "http://espn.go/nfl/team/_/name/bal/baltimore_ravens.html"
doc <- htmlTreeParse(fileUrl2, useInternalNodes = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']",xmlValue)

"JSON"
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/themp731/repos")
names(jsonData)

#Can take R dataframes and move them to json
myson <- toJSON(iris, pretty = TRUE)
#cat(myson)

"DATA TABLES"
#inherents things from data.frame, this is written inC
#usually faster than data.Frame
library(data.table)
DF = data.frame(x = rnorm(9), y = rep(c("a","b","c"),each=3),z=rnorm(9))
DT = data.table(x = rnorm(9), y = rep(c("a","b","c"),each=3),z=rnorm(9))
#you can also use "tables()" which gives us the info on the tables in emmory
mylist <- DT[,list(mean(x),sum(z))]
#Using the := makes a new column. 
newDT <- DT[,w:=z^2] # creates a new column, but this isn't a copy so u need to save it
#Using Temp variables with operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]
#Also can use plyr operations
DT[,a:=x>0]
#And then group by a variable
DT[,b:= mean(x+w),by=a]
#then with special variables
set.seed(123)
DT1 <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT1[, .N,by=x]
#There are keys in tables so they can sort faster