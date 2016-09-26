#Graphics device is something or someplace where things appear
#Windows, .pdfs, .png etc.
#Plots in R need to be sent someplace.
#On Mac screen device is quartz, windows and x11 (linux)

#You can install other devices via Cran
#Not every device is available on all platforms.
#Two basic approaches to plotting 

#First is calling a plot, annotate and enjoy
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Data")

#The other is by explicitly calling a file device
#1 launch a file device, 2. call a plot, 3 annotate, 4 close device
pdf(file = "./work/Explore_week1_test.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful (file device test)")
#THIS IS NECESARRY TO CLOSE DEVICE
dev.off()

#There are two main types of devices: vector and bitmap
#vector: pdf, svg, win.metafile, postscript (things with lines)
#Vector things aren't good with things for points etc.
#bitmap: png, jpeg, tiff, bmp.
#bitmap are a series of pixels and their color values
#these are good for a lot of different points or pictures
#bitmap things don't resize well

#You can open multiple devices simulataneously and launch them explicitly
#plotting can happen on one at a time and that's via dev.cur()
#arrange the device via dev.set(<integer>)
#you can copy plots via dev.copy

quartz()
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful more")
dev.copy(png, file = "./data/oldfaith.png")
dev.off()