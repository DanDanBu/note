# This test is for ACF graph to see the combination of data in different omega and theta attributes

xx=ARMAacf(ar=c(0.9, -0.4), ma=c(-0.8, -0.5),lag.max=13)
plot(y=xx[-1],x=0:12,type='h', xlab='Lag',ylab=expression(rho[k]),axes=F,ylim=c(-0.1,1.0))
points(y=xx[-1],x=0:12,pch=20); abline(h=0)
axis(1,at=0:12, labels=c(0,NA,2,NA,4,NA,6,NA,8,NA,10,NA,12)); axis(2)
text(x=7,y=.5,labels=expression(list(phi==0.9, -0.4, -0.8, -0.5)))
