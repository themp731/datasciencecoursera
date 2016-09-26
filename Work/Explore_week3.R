"Hierarchical Clustering"
#There is agglormerative approach or 'two closest things
#Needs a defined distance and a merging approach
#Produces a tree showing how close things are to eachother.

#How do we define close?
# Continuous/euclidean distance, correlation similarity and binary/manhattan distance
#pick a distance that makes sense.
#The manhattan distance is taking things by going in a grid.

set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x,y, col = "blue", pch = 19, cex = 3)
text(x + 0.05, y+ 0.05, labels = as.character(1:12))
#Calculating distance between points
dataFrame = data.frame(x=x, y=y)
#dist calculates between all the different rows, if you call dist without
# different options it defaults to euclidean distance
dst<-dist(dataFrame)

#By looking at everything you can find that that 5 and 6 are the closest together
#Then we can make a point and combine them and create a new 'super point'
#We can then find things with a 'dendrogram'

distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)
#It doesn't tell us how many clusters there are

#We can get mroe stuff from a clustered dendrogram by downloading something from the website.

#Heatmaps
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)

#Higherarchical clustering can be unstable, can change some points
#Overall pictures might make some weird distances
#Also, change the different scale of points
#choosing where to cut isn't always obcious.

"K- Means Clusting"
#Great for summarizing lots data
#All about looking at things that are close vs. far and how to make that distinction
#Need a fied number of clusters, and a guess on where the centers
#It needs a defined distance metric, some clusters and a guess where to find things
#EXAMPLE:
set.seed(1234)
par(mar = c(0.5,0.5,0.5,0.5))
x1 <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y1 <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x1,y2, col = "blue", pch = 19, cex = 2)
text(x1+0.05, y2 + 0.05, labels = as.character(1:12))

#You choose some random centroids or places that are the gaps between clusters
#Then you take some and assign them to nearest centroid
#Then you reaculate the centroids by taking the means of clusters, then you do that till it looks good
#Kmeans returns a list with cluster elemennts
dataFrame1 <- data.frame(x1,y1)
kmeansobj <- kmeans(dataFrame1, centers = 3)
#plotting kmeans
par(mar = rep(0.2,4))
plot(x1,y1, col = kmeansobj$cluster, pch = 19, cex = 2)
points(kmeansobj$centers, col = 1:3, pch = 4, cex = 4, lwd = 4)
#then using heatmaps with kmeans
set.seed(1234)
dataMatrix <- as.matrix(dataFrame1)[sample(1:12),]
kmeansobj1 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1,2), mar = c(2,2,2,2))
image(t(dataMatrix)[,nrow(dataMatrix):1],yaxt = "n")
image(t(dataMatrix)[,order(kmeansobj1$cluster)],yaxt = "n")
#Kmeans is a good way for looking at patterns in data, but it means we need to have an idea of clusters

#There are other ways of finding how many different clusters.
#K-Means is not deterministic so starting points can be at random.
#Run it three times to make sure you get a good idea of the data.

"DIMENSION REDUCTION"
#I NEED TO DO THIS
