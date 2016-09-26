#X <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3"=sample(11:15))
#X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
#library(plyr)

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./Resources/rests.csv", method = "curl")
restData <- read.csv("./Resources/rests.csv")
print("Summary")
str(restData)

#Makes a table
table(restData$zipCode,useNA = "ifany")

#Any command finds if there are 'any' trues
any(is.na(restData$councilDistrict))

#Cross Tabs
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
print(summary(DF))
xt <- xtabs(Freq ~ Gender + Admit, data=DF)

#creating sequences via seq
s1 <- seq(1,10, by=2); s1
#making variable near me
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")

#Catagorical Variables
restData$zipGroups = cut(restData$zipCode , breaks = quantile(restData$zipCode))
ZIPGROUPS <- table(restData$zipGroups)
#easier way to cut is through Hmisc and Cut2 function

"RESHAPING DATA"
library(reshape2)
data("mtcars")
#melting data sets
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl"), measure.vars=c("mpg","hp"))

"Managing data frames with DPLYR"
#chicago <- readRDS("chicago.rds")

"Merging Data"
