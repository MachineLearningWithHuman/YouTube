#Time series analysis
#basic matrix,linear...matrix..timeseries....box-jenkins....jags...stan.....
#basic matrix
matrix(3,2,4)
matrix(1:12,3,4)
matrix(1:12,3,4,byrow = TRUE)
dim(matrix(1:12,3,4))
class(matrix(1:12,3,4))
typeof(matrix(1:12,3,4))
x <- as.data.frame(matrix(1:12,3,4))
#addition
a <- matrix(1:6,2,3) #dim(2,3)
b <- matrix(1:6,3,2)#dim(3,2)

a*b

a%*%b #matrix mul
b%*%a
a%*%t(a)

#subsettings
a <- matrix(1:9, nrow = 3, ncol =3)
a[1:2,]
a
a[,2]
a[c(1,3),c(1,3)]


#diagonal and identity
diag(1,3)
diag(4,3)
diag(1:3,3)
a <- matrix(3,3,3)
a
diag(a) <- 2
a


a <- matrix(1:9,3,3)
I <- diag(3)

a%*%I


#inverse

a = diag(3,3) + matrix(1,3,3)
inva = solve(a)

inva %*% a
inva

#choleskey decom
inva <- chol2inv(chol(a))
inva %*% a

#----------------------------end of matrix algebra---------------------#
#linear regresion in matrix
library(stats)
library(MARSS)
library(datasets)


data("stackloss",package = "datasets")
data = stackloss[1:4,]
data

#basic regression
lm(stack.loss~Air.Flow,data=data)

#stack.loss = -11.616 + 0.641 * Air.flow + e <- N(0,sigma^2)

fit <- lm(stack.loss~Air.Flow,data=data)
Z <- model.matrix(fit)
Z[1:4,]
#[(z^t*z)^-1*z^t*y]

y <- matrix(data$stack.loss, ncol=1)
y
Z<-cbind(1,data$Air.Flow)
Z

#solve
solve(t(Z)%*%Z) %*% t(Z) %*% y

#multivariant

fit.multi <- lm(stack.loss~.,data=data)
Z <- model.matrix(fit.multi)
Z[1:4,]
fit.multi

y <- matrix(data$stack.loss, ncol=1)
y
#Z<-cbind(1,data$Air.Flow,)
Z<-Z[1:4,]
solve(t(Z)%*%Z) %*% t(Z) %*% y

#normal equation

#y = z*x + e


#groups of intercepts
data = cbind(data, reg=rep(c("n","s"), 4)[1:4])
data
fit2 <- lm(stack.loss~ -1+Air.Flow+reg,data=data)
coef(fit2)

Z= model.matrix(fit2)
Z[1:4,]

y=matrix(data$stack.loss,ncol = 1)
Z=Z[1:4,]

solve(t(Z)%*%Z)%*%t(Z) %*% y

#group of B
#different owner
data = cbind(data, owner=c("s","a"))
data

fit3 <- lm(stack.loss~-1+Air.Flow:owner + reg, data=data)
coef(fit3)
Z= model.matrix(fit3)
Z[1:4,]
y=matrix(data$stack.loss,ncol = 1)
solve(t(Z)%*%Z)%*%t(Z) %*% y


#seasonal effect
#only considering seasonal effect
data = cbind(data,qtr=paste(rep("qtr",4),1:4,sep=""))
data

fit_sea <- lm(stack.loss~-1+qtr,data=data)
coef(fit_sea)

fit_c_sea <- lm(stack.loss~qtr,data=data)
coef(fit_c_sea)
Z=model.matrix(fit_sea)
Z[1:4,]

Z=model.matrix(fit_c_sea)
Z[1:4,]



#putting all it in one
fulldata=stackloss
n =nrow(fulldata)

fulldata = cbind(fulldata,owner=rep(c("a","b","c"),n)[1:n],qtr=paste(rep("qtr",n),1:n,sep=""),
                 reg=rep(c("n","s"),n)[1:n])


fit_full <- lm(stack.loss~-1+qtr+Air.Flow:owner:qtr,data=fulldata)
Z <- model.matrix(fit_full) 
Z<-Z[1:n,]
coef(fit_full)

y=matrix(data$stack.loss,ncol = 1)
solve(t(Z)%*%Z)%*%t(Z) %*% y

#---------------end---------------------------------------













































