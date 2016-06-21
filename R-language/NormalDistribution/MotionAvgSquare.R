w2 = rnorm(500, 0, 1)
v2 = filter(w2, sides=2, rep(1/3, 3))
par(mfrow=(3, 1), mar=c(3, 2, 1, 0)+.5, mgp=c(1.6, .6, 0))
hist(w2[1:100]); hist(w2[1:300]); hist(w2[1:500])

h
# [1] -3 -2 -1 0 1 2 3 4

summary(w2)
#    Min.    1st Qu.    Median      Mean    3rd Qu.   Max.
# -3.44900  -0.70910   -0.07265   -0.03959  0.637    2.59

sd(w2)
# [1] 0.9951563

hist(w2[1:100])
y1 = dnorm(h, mean = -0.03959, sd = 0.9951563)*100*0.5
lines(h, y1, col="red", lwd=2)
hist(w2[1:300])
y2 = dnorm(h, mean = -0.03959, sd = 0.9951563)*300*0.5
lines(h, y2, col="red", lwd=2)
hist(w2[1:500])
y3 = dnorm(h, mean = -0.03959, sd = 0.9951563)*500*0.5
lines(h, y3, col="red", lwd=2)
