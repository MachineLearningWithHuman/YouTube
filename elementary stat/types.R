#Data types in R
#class() and typeof()
#numeric,integer,complex,logic,char

#numeric
num <- 3
class(num)
typeof(num)

x<-as.integer(num)
typeof(x)

comp<- -22-6i
class(comp)
typeof(comp)


x <- 3
y <- x>5
typeof(y)

cha<-"sat"
typeof(cha)



#conversion
num <- 3
int_num <-as.integer(num)
is.integer(int_num)

x <- FALSE
y <- as.integer(x)
is.integer(y)

com_num <- as.complex(num)
class(com_num)

logic_num <- as.logical(num)

is.logical(logic_num)

char_num <- as.array(num)
char_num

mat_num <- as.matrix(num)
mat_num

vec_num <- as.vector(num)
vec_num


data_num <- as.data.frame(num)
data_num$num

list_num <- as.list(num)
list_num

#bye


















