#data structure in R
#vector
x <- c(1,3,5,7,8) #atomic vector
typeof(x)

#matrix


mat <- matrix(1:4, nrow = 2,ncol = 2)
mat

mat2 <- matrix(4:6)
mat2
mat3=cbind(mat2[1:2,])

cbind(mat,mat3)


mat-1
mat3/2
t(mat3)
diag(4)


#vector
#methods
x <- c(1,2,4,6)
x <- seq(0.5,100,by=0.5)
x <- seq(0.5,100,length.out = 100)



#control statesment
values <- 1:10
if(sample(values,1)<=5)
  print(paste(values,"is less than 5"))


values <- c(1,2,3,4,5) 
for(id in 1:5){ 
  print(values[id])
}


#return
check <- function(x) {
  if (x > 0) {
    result <- "Positive"
  } else if (x < 0) {
    result <- "Negative"
  } else {
    result <- "Zero"
  }
  return(result)
}
  
check(-9)


#next
x = 1: 4
for (i in x) {
  if (i == 2) {
    next
  }
  print(i)
}

#break
val <- 5
repeat {
  print(val)
  val <- val+1
  if (val == 10){
    break
  }
}












