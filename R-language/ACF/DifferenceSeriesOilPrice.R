#load the package TSA
library(TSA)

#find oil price data in TSA
data(oil.price)

#first difference plot
win.graph(width=8, height=4, pointsize=12)

plot(diff(log(oil.price)),ylab='Change in Log(Price)',type='l',
+ main='The Difference Series of the Logs of the Oil Price Time')


#================================================================

#Second difference plot 
win.graph(width=8, height=4, pointsize=12)

plot(diff(log(oil.price),2),ylab='Change Acceleration in Log(Price)',type='l',
+ main='The Second Difference Series of the Logs of the Oil Price Time')
