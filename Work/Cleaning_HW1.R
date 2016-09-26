library(xlsx)
library(XML)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "../Resources/Community.csv", method = "curl")
community <- read.csv("../Resources/Community.csv", header = TRUE)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "../Resources/NatGas.xlsx", method = "curl")
natgas <- read.xlsx("../Resources/NatGas.xlsx", sheetIndex = 1, header = TRUE)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmlfile <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(xmlfile)