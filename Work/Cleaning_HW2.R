#GitHub API
library(httr)
myCred <- oauth_app("github",
                     key = "f9907f5260795f710cf4",
                     secret = "a4804d5a963631007a5361c71300c4072bbf110e"
                )
github_token <- oauth2.0_token(oauth_endpoints("github"),
                               myCred)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

#Getting ACS Data
library(sqldf)
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","./Resources/ACS.csv")