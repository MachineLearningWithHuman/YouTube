
#stepwise linear model implementation
library(tidyverse)
library(caret)
library(leaps)


#library MASS has setpwise regression package stepAIC()
library(MASS)

#data to be used swiss
head(swiss)

#Fertility is our target value




total.model <- lm(Fertility~.,data = swiss)

step.model<- stepAIC(total.model,direction = "both",trace = FALSE)
summary(step.model)


back.model <- stepAIC(total.model,direction = "backward",trace = FALSE)
summary(back.model) #it chose back model

#leaps

leaps_model <- regsubsets(Fertility~.,data=swiss,nvmax = 4, method = "seqrep")
summary(leaps_model)

#you have choise over nvmax and method 

leaps_model <- regsubsets(Fertility~.,data=swiss,nvmax = 5, method = "forward")
summary(leaps_model)


#caret
set.seed(123)
train.control <- trainControl(method = "cv",number = 10) #cross validation
step.model <- train(Fertility ~., data = swiss,
                    method = "leapBackward", 
                    tuneGrid = data.frame(nvmax = 1:5),
                    trControl = train.control
)
step.model
summary(step.model)

step.model$fitted.values


#same using MASS 
step.model <- train(Fertility ~., data = swiss,
                    method = "lmStepAIC", 
                    trace=FALSE,
                    trControl = train.control
)
step.model
summary(step.model)

#now you are a pro in using stepwise regression























