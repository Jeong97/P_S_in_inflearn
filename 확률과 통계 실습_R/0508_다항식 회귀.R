#
# 다항식 회귀.
#

# 데이터 시뮬레이션.
x <- seq(0,6.3,0.05)
n <- length(x)
y <- 10*sin(x) + rnorm(n,0,2)
plot(x,y,pch=20,cex=1, col="green")
dat <- data.frame(x,y)

# Power=1.
reg1 <- lm(y~x, dat)
summary(reg1)
plot(x,y,pch=20,cex=1, col="green")
abline(reg1,col="red")

# Power=2.
reg2 <- lm(y ~ x + I(x^2), dat)
summary(reg2)
b0 = coefficients(reg2)[1]
b1 = coefficients(reg2)[2]
b2 = coefficients(reg2)[3]
plot(x,y,pch=20,cex=1, col="green")
lines(x, b0 + b1*x + b2*x^2, col="red")

# Power=3.
reg3 <- lm(y ~ x + I(x^2) + I(x^3), dat)
summary(reg3)
b0 = coefficients(reg3)[1]
b1 = coefficients(reg3)[2]
b2 = coefficients(reg3)[3]
b3 = coefficients(reg3)[4]
plot(x,y,pch=20,cex=1, col="green")
lines(x, b0 + b1*x + b2*x^2 + b3*x^3, col="red")


