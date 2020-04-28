#Credit Card Fraud Detection On sample-Dataset
#importing library
library(ranger)
library(caret)
library(data.table)

data <- read.csv("creditcard.csv/creditcard.csv")

#Exploration
data.table(data)

#doing random statistical bla bla
summary(data)
table(data$Class)
names(data)

#summary of amount
summary(data$Amount)
sd(data$Amount)
IQR(data$Amount)
var(data$Amount)


#manipulation
data$Amount <- scale(data$Amount)     #normalization

data2 <- data[,-c(1)]  #removing time from data
head(data2)

set.seed(12)
library(caTools)

sample_data <- sample.split(data2$Class, SplitRatio = 0.80)

train_data <- subset(data2, sample_data==TRUE)
test_data <- subset(data2, sample_data == FALSE)


dim(train_data)
dim(test_data)

#fit logit on data

Logistic_Model <- glm(Class~., test_data,family = binomial())
summary(Logistic_Model)

plot(Logistic_Model)

Logistic_Model1 <- glm(Class~.,train_data,family = binomial())
summary(Logistic_Model1)

plot(Logistic_Model1)

#we need ROC curve visit bigquery tutorial to learn about ROC
library(pROC)
lr.predict <- predict(Logistic_Model1,test_data,probability = TRUE)
auc.gb <- roc(test_data$Class, lr.predict,plot = TRUE,col="green")

#so we have atmost 90% accuracy but it is not the right method of doing projects like this 
#will discuss later 

#fit a decision tree
library(rpart)
library(rpart.plot)

desicion_model <- rpart(Class ~ . , data, method = "class")
predicted_val <-predict(desicion_model,data,type = "class")
probability <- predict(desicion_model, data, type = 'prob') #spelling typo i had made
rpart.plot(desicion_model)

#do small NN
library(neuralnet)
NN_model <- neuralnet::neuralnet(Class~.,train_data,linear.output = FALSE)
plot(NN_model)

predNN <- compute(NN_model,test_data)
resultNN <- predNN$net.result
resultNN=ifelse(resultNN>0.6,1,0)

#This is the finishing code i am tired and nn will take much longer time to train 
#bye hit like , subscribe and press the bell icon































