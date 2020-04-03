library(cluster.datasets)
data("all.mammals.milk.1956")
head(all.mammals.milk.1956)
# As the initial centroids are defined randomly,
# we define a seed for purposes of reprodutability
set.seed(123)
# Let's remove the column with the mammals' names, so it won't be used in the clustering
input <- all.mammals.milk.1956[,2:6]
# The nstart parameter indicates that we want the algorithm to be executed 20 times.
# This number is not the number of iterations, it is like calling the function 20 times and then
# the execution with lower variance within the groups will be selected as the final result.
clus1<-kmeans(input, centers = 3, nstart = 20)
fviz_nbclust(input,kmeans,method="wss")
clus2<-kmeans(input,centers = 4,nstart=20)
clus2
fviz_cluster(clus2,data=input)
library(cluster)
library(factoextra)
sil <- silhouette(clus2$cluster, dist(input))
fviz_silhouette(sil)