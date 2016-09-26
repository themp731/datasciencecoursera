"QUESTION 1"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "./Resources/ACS1.csv")
acs <-  read.csv("./Resources/ACS1.csv")
library(dplyr)
q1 <- strsplit(names(acs), "wgtp")
q1[123]

"QUESTION 2"
