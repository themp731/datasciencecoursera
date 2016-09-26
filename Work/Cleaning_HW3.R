"QUESTION 1"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "./Resources/ACS.csv")
acs <-  read.csv("./Resources/ACS.csv")
library(dplyr)
agricultureLogical <- acs$ACR >= 3 & acs$AGS >= 6
print(which(agricultureLogical)[1:3])

"QUESTION 2"
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "./Resources/Jeff.jpeg")
jeff <- readJPEG("./Resources/Jeff.jpeg", native = TRUE)
print(quantile(jeff, c(0.3,0.8)))

"QUESTION 3"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "./Resources/GDP.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "./Resources/edDATA.csv")
GDP <- read.csv("./Resources/GDP.csv", skip = 4)
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
EDU <- read.csv("./Resources/edDATA.csv")
