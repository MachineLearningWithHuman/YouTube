#type 2 error
#hypothesis testing H0 is not true but you failed to reject that type-2
#probability of avoiding the type2 error is termed as power
#1-B
#case1: type 2 error of lower tail test of population mean with known variance
#Ho : mu >= mu0
#normal distribution 

#phillips CEO 
mu0=10000
mu =9950
sd=120
se=0.05
#probability of getting typeii error with 30 samples
n=30
sigma=sd
sem= sigma/sqrt(n)

#lower bound of sample mean for which hypothesis 9964

alpha=se
mu0

q= qnorm(alpha, mu0,sem)
q

mu=9950
pnorm(q,mu,sem,lower.tail=FALSE)


#upper tail: mu <=mu0 

q = qnorm(alpha,mu0,sem,lower.tail = FALSE)
q
mu=9950
pnorm(q, mu,sem)

#two tail test mu=mu0
I=c(alpha/2 , 1-alpha/2)
q= qnorm(I,mu0,sem)
q


pnorm(q,mu,sem)


#inference about two populations
#population mean between two matched sample
library(MASS)
immer
#paired t-test
#
t.test(immer$Y1,immer$Y2,paired = TRUE)

#95% confidence interval difference in mean between bearly 1931 to 1932 6.1 to 25.7

hist(immer$Y1)
hist(immer$Y2)

median(immer$Y1)
median(immer$Y2)


#independent distribution
#unpaired t-test
mtcars$mpg
mtcars$am

L = mtcars$am == 0
mpg.auto =mtcars[L,]$mpg
mpg.auto

mpg.manual=mtcars[!L,]$mpg
mpg.manual


t.test(mpg.auto,mpg.manual)
t.test(mpg~am, data=mtcars)


#
quine
table(quine$Eth,quine$Sex)
prop.test(table(quine$Eth,quine$Sex),correct = FALSE)
















