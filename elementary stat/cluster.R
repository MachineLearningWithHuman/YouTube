#Customer Segmentation in R implementing K-means algorethem

getwd()
setwd("D:/customer segmentation/customer-segmentation-dataset/customer-segmentation-dataset")


#load the data
customer_data <- read.csv("Mall_Customers.csv")
str(customer_data)

#columns names
names(customer_data)


#visualize data
data.table::data.table(customer_data) #head()

#quick summary of data
summary(customer_data)


#some statistical value of features
sd(customer_data$Age)
sd(customer_data$Annual.Income..k..)
sd(customer_data$Spending.Score..1.100.)
IQR(customer_data$Age)
IQR(customer_data$Annual.Income..k..)
IQR(customer_data$Spending.Score..1.100.)

#plot

gender = table(customer_data$Gender)
barplot(gender, main="Using BarPlot to display Gender Comparision",
                 ylab = "Number",
                xlab = "Gender",
                col = ncol(gender),
                 legend=rownames(gender)) #i think you learn a lot here

#female is in higher trend than male

pct = round((gender/sum(gender))*100)
lbs = paste(c("Female","Male")," ",pct,"%",sep=" ")
library(plotrix)
pie3D(gender,labels = lbs,main="Pie Chart Depicting Ratio of Female and Male")

#Age
hist(customer_data$Age,
     col="red",
     xlab="Age Class",
     ylab = "Frequency",
     labels = TRUE)

#next thing to do is to pplot a boxplot for age
boxplot(customer_data$Age,
        col=rainbow(1),
        main="Boxplot for Descriptive Analysis of Age",labels=TRUE)

#median value 30-35 no outlier

#Annual income
hist(customer_data$Annual.Income..k..,
     col="green",
     xlab="income Class",
     ylab = "Frequency",
     labels = TRUE)


plot(density(customer_data$Annual.Income..k..),
     col="yellow",
     main="Density plot for Annual Income",
     xlab = "Income",
     ylab = "Density")
polygon(density(customer_data$Annual.Income..k..),col = "green")

#average 70 (mode) mean 60.56 normal distribution

#spending

plot(density(customer_data$Spending.Score..1.100.),
     col="yellow",
     main="Density plot for Annual spending",
     xlab = "Income",
     ylab = "Density")
polygon(density(customer_data$Spending.Score..1.100.),col = "green")



hist(customer_data$Spending.Score..1.100.,
     col="green",
     xlab="spending ",
     ylab = "Frequency",
     labels = TRUE)


boxplot(customer_data$Spending.Score..1.100.,
        col=rainbow(1),
        main="Boxplot for Descriptive Analysis of spending",horizontal = TRUE)


#k-mean

#1. We specify the number of clusters that we need to create.
#2. The algorithm selects k objects at random from the dataset.
#This object is the initial cluster or mean.
#3. The closest centroid obtains the assignment of a new observation. We base this 
#assignment on the Euclidean Distance between object and the centroid.
#update
#iteration until finish

#1. We specify the number of clusters that we need to create. How?

#Elbow method
#Silhouette method
#Gap statistic

#Elbow method :intra-cluster variation stays minimum
library(purrr)
set.seed(2)
# function to calculate total intra-cluster sum of square(eucledian distance)
ics <- function(k){
  
  kmeans(customer_data[,3:5],k,iter.max = 100,nstart = 100,algorithm = "Lloyd")$tot.withinss
  
  
}

k_values <- 1:12

ics_values <- map_dbl(k_values, ics)


plot(k_values, ics_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total intra-clusters sum of squares")
#4 clusters
#Average Silhouette Method
library(cluster) 
library(gridExtra)
library(grid)
k2<-kmeans(customer_data[,3:5],2,iter.max=100,nstart=50,algorithm="Lloyd")
s2<-plot(silhouette(k2$cluster,dist(customer_data[,3:5],"euclidean")))


k3<-kmeans(customer_data[,3:5],3,iter.max=100,nstart=50,algorithm="Lloyd")
s3<-plot(silhouette(k3$cluster,dist(customer_data[,3:5],"euclidean")))



k4<-kmeans(customer_data[,3:5],4,iter.max=100,nstart=50,algorithm="Lloyd")
s4<-plot(silhouette(k4$cluster,dist(customer_data[,3:5],"euclidean")))

#do it for 12 times

k5<-kmeans(customer_data[,3:5],5,iter.max=100,nstart=50,algorithm="Lloyd")
s5<-plot(silhouette(k5$cluster,dist(customer_data[,3:5],"euclidean")))


k6<-kmeans(customer_data[,3:5],6,iter.max=100,nstart=50,algorithm="Lloyd")
s6<-plot(silhouette(k6$cluster,dist(customer_data[,3:5],"euclidean")))


k7<-kmeans(customer_data[,3:5],7,iter.max=100,nstart=50,algorithm="Lloyd")
s7<-plot(silhouette(k7$cluster,dist(customer_data[,3:5],"euclidean")))



k8<-kmeans(customer_data[,3:5],8,iter.max=100,nstart=50,algorithm="Lloyd")
s8<-plot(silhouette(k8$cluster,dist(customer_data[,3:5],"euclidean")))




k9<-kmeans(customer_data[,3:5],9,iter.max=100,nstart=50,algorithm="Lloyd")
s9<-plot(silhouette(k9$cluster,dist(customer_data[,3:5],"euclidean")))




k10<-kmeans(customer_data[,3:5],10,iter.max=100,nstart=50,algorithm="Lloyd")
s10<-plot(silhouette(k10$cluster,dist(customer_data[,3:5],"euclidean")))




k11<-kmeans(customer_data[,3:5],11,iter.max=100,nstart=50,algorithm="Lloyd")
s11<-plot(silhouette(k11$cluster,dist(customer_data[,3:5],"euclidean")))




k12<-kmeans(customer_data[,3:5],12,iter.max=100,nstart=50,algorithm="Lloyd")
s12<-plot(silhouette(k12$cluster,dist(customer_data[,3:5],"euclidean")))


#we make use of the fviz_nbclust() function
#to determine and visualize the optimal number of clusters

library(NbClust)
library(factoextra)
fviz_nbclust(customer_data[,3:5], kmeans, method = "silhouette")


#Gap Statistic Method
set.seed(125)
stat_gap <- clusGap(customer_data[,3:5], FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(stat_gap)


#so go with 6
k6

#Visualizing the Clustering Results using the First Two Principle Components

pccluster = prcomp(customer_data[,3:5],scale = FALSE)
summary(pccluster)
pccluster$rotation[,1:2]

#visualize
set.seed(1)
ggplot(customer_data, aes(x =Annual.Income..k.., y = Spending.Score..1.100.)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name=" ",
                       breaks=c("1", "2", "3", "4", "5","6"),
                       labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5","Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")



#k-mean
ggplot(customer_data, aes(x =Spending.Score..1.100., y =Age)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name=" ",
                       breaks=c("1", "2", "3", "4", "5","6"),
                       labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5","Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")


#finally visualize k-mean values
kCols=function(vec){cols=rainbow (length (unique (vec)))
return (cols[as.numeric(as.factor(vec))])}
digCluster<-k6$cluster; dignm<-as.character(digCluster); # K-means clusters
plot(pccluster$x[,1:2], col =kCols(digCluster),pch =19,xlab ="K-means",ylab="classes")
legend("bottomleft",unique(dignm),fill=unique(kCols(digCluster)))





#Thank you 






































































