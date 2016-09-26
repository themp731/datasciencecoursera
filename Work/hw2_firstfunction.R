#This is just adding things together
add2 <- function(x,y){
  z<-(x+y)
  print(z)
}

#This is two vectors
above_ten <- function(x){
  #Creates a logical vector with TRUES and FALSES
  use <- (x > 10)
  x[use]
}

#And this is when I put what I want
above <- function(x, n){
  use <- x > n
  x[use]
}

#This is with a default value
above_def <- function(x, n=10){
  use <- x < n
  x[use]
}

#Column Mean, This is going to help with my program later
columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  #initialize a vector for the means
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

"Functions Part 1"
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

#You can mix positional matching by name
#Argument Matching, named things are good
#for command line stuff, so you don't need
#to remember the order of stuff

f <- function(a, b=2, c=2, d=NULL){
  print(a)
  print(b)
}

#... can use a variable number of arguments
myplot <- function(x, y, type = "l", ...){
  plot(x, y, type = type, ...)
}
#and then paste and cat use the first set of arguments
# buy anything after the '...' must be defined

"BINDING VALUES"
lm <- function(x){
  x * x
}