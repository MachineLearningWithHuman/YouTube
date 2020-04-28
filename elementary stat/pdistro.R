#measurements
#mean >>> avg >>>> w_avg
duration = faithful$eruptions
waiting <- faithful$waiting
mean(duration)
median(duration)

#Quartile

quantile(duration)
range(duration)

quantile(duration, c(0.24,.77,.97))

#IQR
IQR(duration)

#plot central tendency
boxplot(duration,horizontal = TRUE)

#spread
var(duration)
sd(duration)

#hist
hist(duration)

#range
lower_range = mean(duration) - (3*sd(duration))
higher_range = mean(duration) + (3*sd(duration)) #99.7% 

#covariance/corelation
cov(duration,duration) 
cov(duration,waiting)
cor(duration,duration)
cor(duration,waiting)

#skweness
skewness(duration)
skewness(waiting)

mtcars

cor(mtcars$mpg,mtcars$disp)












#probability distributions
#discrete continous
dbinom(4, size=12, prob=0.2)

#3 heads /3 tails at a time
dbinom(3,size = 10,prob = 0.5)


#atmost 3 heads 
pbinom(3,size = 10, prob = 0.5)

dbinom(3,size = 10,prob = 0.5)+dbinom(1,size = 10,prob = 0.5)+dbinom(2,size = 10,prob = 0.5)+dbinom(0,size = 10,prob = 0.5)

#atleast 
1 - pbinom(3,10,0.5)





#poission distribution
#n = too large
#p = too small
#lambda= n*p
#accident of airplane 
ppois(16,lambda = 12)  #lower tail poission
1- ppois(16,lambda = 12)   #upper tail
ppois(16, lambda = 12, lower.tail = FALSE)





#continous 

runif(10)
x <- runif(10)
hist(x)
x<- runif(1000)
hist(x)

hist(runif(100,min=5,max=5.5))

#exponential distribution
pexp(2,rate=1/3)


#normal distribution 
pnorm(100)
pnorm(84,23,45,lower.tail = FALSE) #23,45 >=84







#chi square 
#size, swimming pool
qchisq(.95,df=2)

#student t distribution 
#two random variables  z normal distro   Y chisq df m independent 
# t = Z/sqrt(Y/m)   ~t()

qt(c(0.025,0.975), df=5)


#F-distro
#f=v1/m1/v2/m2......
qf(0.95,2,3)















































































