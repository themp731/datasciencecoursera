library(nlme)
library(lattice)
plot1 <- xyplot(weight ~ Time | Diet, BodyWeight)
#print(plot1)

library(ggplot2)
library(datasets)
data(airquality)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)

qplot(votes, rating, data = movies)