"Lesson 1: Graphs"
# Three Principles of Analytic Graphics
#1: Show Comparisons
#2: Show causality
#3: Show multivariate
#4: Integrate Evidence
#5: Describe and document evidence.
#6: Content is King, have an interesting story.

#Why do we use graphs?
# To udnerstand data, to find patterns, to suggest modeling strategoes. to debug and to communicate results.
#GRAPHS: Boxplot, summary, historgram, barplot
#Simple Summaries of Data: 2 Dimensions of data, scatterplots and other 1D plots

"Lesson 2: Ploting Systems"
#Base plotting: blank canvas and builds from there and you can modify from there.
#Draw banks, you can't go back once the plot has started and then you need to set everything once you start.
#BASEPLOT
library(datasets)
data(cars)
with(cars, plot(speed, dist))

#The next system is the lattice system, this makes a plot with a single function call.
#xyplot, bwplot etc., so you need to specify a lot of specific stuff, good for
#putting a lot of different stuff on at once.
#LATTICEPLOT
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data =  state, layout = c(4,1))

#Last plotting system is the GGPLOT2 or the 'grammar graphics'
#Somewhat of a mix of lattice and baseplot.
#GGPLOT2
library(ggplot2)
data(mpg)
qplot(disp, hwy, data = mpg)

#Base Plotting Sytem Again
#Core plotting is in the R graphics package.
#There is other stuff in 'grDevices'
#Lattice is in the lattice and 'grid' packages

#Base plotting there are two phases, initializing and annotating
#Simple Base Histogram
library(datasets)
hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
#initializing a plot
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone")

#Some basic Parameters
#pch: Plotting symbol
#lty: line type
#lwd: line width
#col: plotting color
#xlab: xlabel
#ylab: ylabel

#par() function gives global graphcis parameters
#las: orintation of axes
#bg: background color
#mar: inner margin size
#oma: outer margin size
#mfrow: number of plots per row, column
#mfcol: number of plots per row, column

#plot makes scatter plit
#lines adds lines to plot
#points adds points to a plot
#text adds text to a plot
#title adds annotations to anything
#mtext gives arbitrary text

#BASEPLOT with annotation
with(airquality, plot(Wind, Ozone, main = "Ozone in NYC"))
with(subset(airquality, Month == 5), points(Wind,Ozone, col = "blue"))

#When you initiate things with "type = n" then it initializes the plot
#but nothing is drawn

#Regression line.
with(airquality, plot(Wind, Ozone, main = "Ozone with Regression", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

#Multiple Base Plots
par(mfrow = c(1,2))
with(airquality, {plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar")
  plot(Temp, Ozone, main = "Ozone and Temp")
  mtext("Ozone and Weather in NYC", outer = TRUE)})

