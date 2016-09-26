"Lattice Plotting System"
#For high dimensional data and lots of plots at once
#no annotation in lattice, have to do everythingat once
#need to load library, things take the a formula

library(lattice)
library(datasets)
airquality <- transform(airquality, Month = factor(Month))
p <- xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))
print(p)
#Lattice things don't plot to a device. you need to print it to a device

#Lattice comes with a lot of default panel functions.
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
zplot <- xyplot(y~x | f, layout = c(2,1))
fplot <- xyplot(y~f | f, layout = c(2,1))
print(zplot)
print(fplot)