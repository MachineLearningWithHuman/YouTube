#interval Estimation
#estimate the population parameter from sample/random sample data 
library(MASS)
head(survey)
help("survey")


#point estimation of population mean
#sample mean
age.mean <- mean(survey$Age, na.rm = TRUE)
age.mean


#interval estimation  of population mean with K-variance

#assume the std of population is 5.45: margin of error and interval estimation 
#@95% confidence interval

age.response = na.omit(survey$Age)

n=length(age.response)
sigma=5.45
sem=sigma/sqrt(n)
sem


E=qnorm(.975)*sem

age.mean + c(-E,E)

#instead of this textbook formula 
library(TeachingDemos)
z.test(age.response,sd=sigma)


#unknow variance
#sigma=?
SE=sd(age.response)/sqrt(n)
#student-t distribution
E = qt(.975, df=n-1)*SE
E

age.mean + c(-E,E)

t.test(age.response)


sigma=5.45  E=0.8 #95% confidence interval
zstar=qnorm(0.975)
sigma=sigma
E=0.8
Sample_size=zstar^2*sigma^2/E^2
Sample_size


#point estimation of population proportion
#find the point estimate of female proportion with the survey
gender.response <- na.omit(survey$Sex)
n=length(gender.response)

k=sum(gender.response=="Female")
pbar=k/n

pbar


#interval estimation  of population proportion
gender.response
n
k
pbar

SE=sqrt(pbar*(1-pbar)/n)
SE

E=qnorm(.975)*SE
E

pbar + c(-E,E)


#sampling size of the population proportion
zstar=qnorm(.975)
p=0.5
E=5/100

sample_size= zstar^2 * p *(1-p)/E^2
sample_size














































































