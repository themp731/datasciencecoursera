"LOOP Functions"
#They use 'apply' like lapply,slappy,tapply etc.

x <- list(a=1:5, b=rnorm(10))
j <- lapply(x, mean)

y <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
z <- lapply(y, mean)

mn <- 1:4
op <- lapply(mn, runif)

#Lapply returns a list, sapply will try to take lapply
#but instead try to turn it into a vector, or a matrix if a list has elements of same length

sap <- list(a=1:4, b=rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
d <- lapply(sap, mean)
e <- sapply(sap,mean)

"Loop functions with 'APPLY"
#You usually want to use 'APPLY' because its less typing
#A Margin is a vector that retains a 'margin'
x <- matrix(rnorm(200), 20, 10)
z <- apply(x,1,mean)
rowSums = apply(x,1,sum)
rowMeans = apply(x,1, mean)
colSums=apply(x,2,sum)
colMeans=apply(x,2,sum)

#Check documentation for 'quantile' you pass the arguments after
z <- apply(x,1, quantile, probs = c(0.25,0.75))

a <- array(rnorm(2*2*10), c(2,2,10))
#check this out in a bit

"Working with MAPPLY"
#THis is a multivariate application
a <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
#instead we could do the below
b <- mapply(rep, 1:4, 4:1)
#This is how we apply a function accross arguments

noise <- function(n, mean, sd){
  rnorm(n,mean,sd)
}
z <- noise(5,1,2)

#to get more we use mapply
y <- mapply(noise, 1:5, 1:5, 2)
#which is easier than doing a 'list' with
#A lot of different arguments

"TAPPLY"
#applying a function over a vector subset.
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
z <- tapply(x,f,mean)
#This brings in seperate lists
j <- tapply(x,f,mean, simplify = F)
k <- tapply(x, f, range)

"SPLIT"
#Takes the vector and splits the groups into different pieces
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
ron <- split(x,f)

#With dataframes
library(datasets)
head(airquality)
airquality$Month
s <- split(airquality, airquality$Month)
a <- lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
#Split helps get the dataframe into pieces so we can then work in different pieces

x <- rnorm(10)
f1 <-gl(2,5)
f2 <-gl(5,2)
interaction(f1,f2)

#We can split on many different levels, and dropping extra levels
#str(split(x, list(f1,f2), drop = TRUE))

"DEBUGGING"
#mean(bourne)
#traceback()
#Traceback needs to be immediately after the function that blew up
#You can debug any function using 'debug'
#Other debugging functions:
    #traceback, debug (step through code one at ta time.), browser (suspends execution of function goes to debug mode), 
    #trace (insert debugging code) and recover (modify error behavior)
printmessage <- function(x){
  if(x>0)
    print("x is greater than zero")
  else
      print("x is less than zero")
  invisible(x)
}