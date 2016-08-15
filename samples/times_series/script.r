#!/usr/bin/env Rscript

#install.packages("forecast")

library(forecast)


traffic <- read.csv2("input.txt", header = TRUE)

days <- seq(1:length(traffic))

myts <- ts(traffic) 
fit <- auto.arima(myts)

#fit <- arima(myts, order = c(8,0,4))
#pred<-predict(fit,n.ahead=30)

fit <- arima(myts,order=c(2,1,5),seasonal=list(order = c(2,0,0), period = 30),method="CSS")
pred <- (predict(fit,30))

pred

plot(myts,xlim=c(0,550),type="o", lwd="1")
lines(pred$pred,col="red",type="o",lwd="1")
grid()

for (o in pred$pred) write(o, stdout())

