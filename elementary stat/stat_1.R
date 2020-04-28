#Statistics With R
#Qualitative data---->>>>
library(MASS)
painters
head(painters)

painters$School

school = painters$School
#frequency count(*)
school.freq=table(school)
school.freq
cbind(school.freq)


#relative frequency
rel.freq<-school.freq/nrow(painters)
rel.freq
old = options(digits = 2)
rel.freq
options(old)

#plot
barplot(school.freq)
colors=c("red","blue","pink","cyan","orange","green","violet","black")
barplot(school.freq,col = colors)

#pie plot
pie(school.freq)
pie(school.freq,col = colors)

#summary
school
c_school= school == "C"   #logical index vector
c_school
c_painter = painters[c_school,]
mean(c_painter$Composition)

#tapply
tapply(painters$Composition, painters$School, mean)
tapply(painters$Composition, painters$School, sd)
tapply(painters$Composition, painters$School, range)
tapply(painters$Composition, painters$School, IQR) #outlier detection 


#Quantitative data
str(faithful)
is.na(faithful)
duration=faithful$eruptions
range(duration)

breaks= seq(1.6,5.2, by=0.4)
breaks
duration.bucket <- cut(duration, breaks, right=FALSE)

duration.bucket<-table(duration.bucket)

barplot(duration.bucket,col=colors)
hist(duration)


#relative frequency
duration
breaks
duration.bucket
duration.bucket/nrow(faithful)
#cumulative frequency
duration
breaks
cum.value <- cumsum(duration.bucket)
cbind(cum.value)

cumsumfre0=c(0,cumsum(duration.bucket))
plot(breaks,cumsumfre0,main = "Old FailthFul Eruptions",xlab ="Duration(min)",
     ylab="cumulatibe sumation")
lines(breaks,cumsumfre0)

#stem and leaf plot
stem(duration)

#scatter plot 
duration = faithful$eruptions
waiting= faithful$waiting
plot(duration,waiting)

























