x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x,y)
z <- rnorm(100)
plot(x,z)

#Changing the default margin
par(mar = c(4,4,2,2))
plot(x,y)

#Changing the symbol
plot(x,y, pch = 13)
#If you run 'example(points)' you can see all the options
#With text and other stuff
plot(x,y, pch = 20, xlab = "Weight", ylab = "Height", main = "Scatter")
text(-2,-2, "Random Text")
legend("topleft", legend = "Data", pch = 20)
fit <- lm(y~x)
abline(fit, lwd = 3.25, col = 3)

#Multiple Plots, using the mfrow
par(mfrow = c(2,2))
plot(x,y, pch = 20, main = "top")
plot(x,z, pch = 10, main = "bottom")
plot(z,x)
plot(z,y)

#annotating things
g <- gl(2,20, labels = c("Male", "Female"))
str(g)
plot(x,y, type = "n")
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue")