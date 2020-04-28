

#This is your console/Editor looks like in R
getwd() #will give your current directory

#you need to set your current directory to your data directory
#here  D:/Mah Ha   remember R follows unix command syntax so if you are in windows change \ to /

setwd("D:/Mah Ha")

library(readxl)
taxesdata <- read_excel("taxesdata.xlsx")

#your data 
data.table::data.table(taxesdata)


#or you can try this
#Done
