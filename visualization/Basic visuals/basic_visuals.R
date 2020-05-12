# visualization to consider while R
#scatter plot
#use when you are in relationship
data <- mtcars
data$cyl<-as.factor(data$cyl)
library(ggplot2)
ggplot(data,aes(drat,wt)) +
  geom_point(aes(color=cyl))+scale_x_continuous("drat", breaks = seq(0,5,0.5))+
  scale_y_continuous("wt", breaks = seq(0,5,by = 0.5))+ theme_bw() +labs(title = "scatterplot")

#for different
ggplot(data,aes(drat,wt)) +
  geom_point(aes(color=cyl))+scale_x_continuous("drat", breaks = seq(0,5,0.5))+
  scale_y_continuous("wt", breaks = seq(0,5,by = 0.5))+ theme_bw() +labs(title = "scatterplot")
+facet_wrap(~cyl)


#histogram
#if you are continous with your data
ggplot(data, aes(drat)) + geom_histogram(binwidth = .2,aes(color=cyl))+
  scale_x_continuous("drat", breaks = seq(0,5,by =0.5))+
  scale_y_continuous("Count", breaks = seq(0,30,by =3))+
  labs(title = "Histogram")

#bar and stack chart
ggplot(data, aes(am)) + geom_bar(fill = "red")+theme_bw()+
  scale_x_continuous("am", breaks = seq(0,1)) + 
  scale_y_continuous("Count", breaks = seq(0,30,3)) +
  coord_flip()+ labs(title = "Bar Chart") + theme_gray()

ggplot(data, aes(am,vs)) + geom_bar(stat="identity",fill = "darkblue")+theme_bw()+
  scale_x_continuous("am", breaks = seq(0,1)) + 
  scale_y_continuous("vs", breaks = seq(0,30,3)) +theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
 +labs(title = "Bar Chart") + theme_gray()

#stacked bar chart
ggplot(data,aes(cyl,fill=cyl))+geom_bar()+
  labs(title = "Stacked Bar Chart", x = "cyl", y = "Count")

#boxplot
ggplot(data, aes(cyl, mpg)) + geom_boxplot(fill = "red")+
  scale_y_continuous("mpg", breaks= seq(0,30, by=5))+
  labs(title = "Box Plot", x = "Outlet Identifier")

#Area chart
ggplot(data, aes(mpg)) + geom_area(stat = "bin", bins = 3, fill = "steelblue") + scale_x_continuous(breaks = seq(0,35,5))+
  labs(title = "Area Chart", x = "mpg", y = "Count") 

#heatmap
ggplot(data, aes(mpg,cyl))+
  geom_tile(aes(fill =wt))+
  labs(title ="Heat Map", x = "mpg", y = "disp")+
  scale_fill_continuous(name = "hp")

#writing file to use in other tools
write.table(data, file="mtcars.csv",sep=",",row.names=F)
























