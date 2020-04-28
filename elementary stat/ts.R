#UNDERSTANDING ARIMA MODEL FOR TIME SERIES ANALYSIS

#first see where your work directory is
getwd()

#set the destination
setwd("D:/Time series/finance model")   #unix style

#Time series as you know presicting the future value based on series of previous value
#package required
library(ggplot2)
library(tseries)
library(forecast)


#read the data
daily_data = read.csv("./data/AAPL10Y.csv", stringsAsFactors = FALSE)

#data view
datatable(daily_data)


#summary of data
summary(daily_data)

#let's make our date column date
daily_data$date <- as.Date(daily_data$date)

summary(daily_data)

#we have date in reverse order in our database
daily_data<-daily_data[order(as.Date(daily_data$date,format="%d/%m/%Y")),]

head(daily_data) #ok

#visualize the data
ggplot(daily_data, aes(date,close))+
  geom_line()+scale_x_date("Time in Year")+
  ylab("Daily closing volumn")+xlab("")

#by looking at our data we know that our data has trend and some seasonal component as well
#look closely at the curser don't you yhink it might by an outlier so R provides us some
#package to deal with outlier in Time series

#let's Build our data for time series
close_ts <- ts(daily_data[,c("close")])

daily_data$clean_close <- tsclean(close_ts)

#summary
summary(daily_data$clean_close)
summary(daily_data$close)

#it removes most extreme observation as outlier by its internal algorethem
#plot it
ggplot(daily_data, aes(date,clean_close))+
  geom_line()+scale_x_date("Time in Year")+
  ylab("Daily closing volumn cleaned")+xlab("")

#see it smoothen the portion of peak in the curve

#moving average is very important to understand trend and mean value estimation in 
#time series analysis

daily_data$close_ma = ma(daily_data$clean_close, order = 7)
daily_data$close_ma30 <- ma(daily_data$clean_close, order = 30)

#plot all the data

ggplot()+
  geom_line(data=daily_data, aes(x=date, y= clean_close, colour="Counts")) +
  geom_line(data=daily_data, aes(x=date, y= close_ma, colour="moving average (w)"))+
  geom_line(data=daily_data, aes(x=date, y= close_ma30, colour="moving average (m)"))+
  ylab("Closing volume")


#decompose your data
#time series are composite of seasonality, trend, and cycle and the rest is error
#or residual
#the process of extracting this component is called decomposing
#it canbe additive means trend+seasonality+...... or multiplicity

#to decompose seasonality we need stl()
close_ma = ts(na.omit(daily_data$close_ma),frequency = 30)
decomp = stl(close_ma, s.window = "periodic")
deseasonal_close <- seasadj(decomp)
plot(decomp)

#now we can apply time-series ARIMA MODEL to a stationary model
#stationary means constant mean and variance with time no trend or seasonality
#standard to use ADF test
adf.test(close_ma, alternative = "stationary")

#p value is higher than 0.05 means we are rejecting null hypo... it is not stationary
#remedies  simple difference/log /log difference
#the number of difference is I in ARIMA 


#Autocorelation and choosing order 

#ACF PACF PLOT HELPS 
Acf(close_ma, main="")
pacf(close_ma,main="")

#we need stationary data
close_d1 = diff(deseasonal_close, diff=1)
plot(close_d1)
#mean becomes stationary but not the variance
adf.test(close_d1,alternative = "stationary")

#we passed p-value by differenci.. one time

Acf(close_d1, main="ACF for differenced series")
pacf(close_d1, main="Pacf for differenced series")



#we can use arima or auto.arima to forecast
auto.arima(deseasonal_close, seasonal = FALSE)

#you can write the equation it gives for your data
# Yt = ar1*yt-1 + ar2*yt-2 + ma1*e1 + ma2*e2 +ma3*e3 +ma4*e4 +E
#(p=lag,d=difference,q=ma)
#target is to lower the AIC value 

fit<-auto.arima(deseasonal_close, seasonal=FALSE)
tsdisplay(residuals(fit), lag.max=45, main='(2,1,4) Model Residuals') 


fit2<-arima(deseasonal_close,order = c(5,1,4))
fit2
tsdisplay(residuals(fit2), lag.max=45, main='(5,1,4) Model Residuals')

#forcast
fcast <- forecast(fit2, h=30)
plot(fcast)


#compare
hold <- window(ts(deseasonal_close), start=2450)

fit_no_holdout = arima(ts(deseasonal_close[-c(2450:2480)]), order=c(5,1,4))

fcast_no_holdout <- forecast(fit_no_holdout,h=30)
plot(fcast_no_holdout, main=" ")
lines(ts(deseasonal_close))

#is there still seasonal pattern observed in data

fit_w_seasonal <- auto.arima(deseasonal_close, seasonal = TRUE)
fit_w_seasonal

sea_forecast <- forecast(fit_w_seasonal, h=30)
plot(sea_forecast)

#End 



























