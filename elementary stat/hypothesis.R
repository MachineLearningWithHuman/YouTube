#Hypothesis testing and type 2 error
#lower tail test of population mean with known variance
#Ho: mu >= mu0; Z= (X_BAR - mu0/var/sqrt(n))  
# z <= -za;   za=100(1-a)percentile of the nd....
#mean=10000 hours
#n = 30
#x_bar = 9900 hours
#std = 120 hours
#a =0.05
#can we reject the claim by phillips?
#Ho : mu >=10000   #test statistics
xbar= 9900
mu0 = 10000
sigma=120
n=30

z = (xbar - mu0)/(sigma/sqrt(n))


#critical value
alpha = 0.05
z.alpha=qnorm(1-alpha)
-z.alpha


-z.alpha > z

#we are rejecting the null hypothesis
pval = pnorm(z)
pval

#upper tail 
#mu <= mu0   #known variance z-test
z
z.alpha

z.alpha > z



#two tail test
#Ho: mu=mu0
#alpha=alpha
#100(1- alpha/2) percentile

mu0=15.4
n=35
xbar=14.8
sigma=2.5


Z=(xbar-mu0)/(sigma/sqrt(n))

z.half.alpha=qnorm(1-alpha/2)
c(-z.half.alpha,z.half.alpha)

#we cannot reject null hypothesis here 
pval = 2* pnorm(Z)
pval                    #two tailed p-value

--------------------------------------------------------
  
#unknown variance
#lower tail under unknown variance
#mu >= mu0   mu <= mu0   mu=mu0
  

#t-statistics
xbar= 9900
mu0 = 10000
sigma=125
n=30


t = (xbar-mu0)/(sigma/sqrt(n))

t.alpha <- qt(1-alpha,df=n-1)
-t.alpha
t.alpha

pval = pt(t,df=n-1)
pval

t.half.alpha <- qt(1-alpha/2, df=n-1)
c(-t.half.alpha,t.half.alpha)

t
pval=2 *pt(t,df=n-1)
pval

#p > p0 p0 hypothesized lower bound p population proportion
#voted population
bar=85/148
p0=.6
n=148

z=(bar-p0)/sqrt(p0*(1-p0)/n)
z          #test statistice
z.alpha=qnorm(1-alpha)
-z.alpha

pval=pnorm(z)
pval



































































































