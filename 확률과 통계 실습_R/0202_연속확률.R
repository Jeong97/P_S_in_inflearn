#
# R의 확률 함수: 연속확률
#

#
# dxxx() : 확률밀도함수. xxx = 확률분포의 명칭.
# pxxx() : 누적확률.
# qxxx() : 분위수.
# rxxx() : 랜덤넘버.
#

#
# 연속 균등분포.
#

# 확률밀도함수를 시각화 해본다.
x <- seq(-3,3,0.001)
plot(x, dunif(x,-1,1), type="l",col="blue")

# 누적확률.
punif(0,-1,1)
punif(0.9,-1,1)

# 분위수.
qunif(0.5,-1,1)
qunif(0.1,-2,2)

# 랜덤넘버 생성.
runif(10,100,110)
runif(10)

#
# 정규 분포.
#

# 확률밀도함수를 시각화 해본다.
x <- seq(-4,4,0.01)
plot(x, dnorm(x,0,1), type="l",col="blue")

# 누적확률.
pnorm(0,0,1)
pnorm(1,0,1)
pnorm(2,0,1)

# 분위수.
qnorm(0.01,0,1)
qnorm(0.5, 0,1)
qnorm(0.99,0,1)

# 분위수는 누적확률의 역함수.
pnorm(qnorm(0.01))
pnorm(qnorm(0.5))
pnorm(qnorm(0.99))

# 랜덤넘버 생성.
rnorm(10)
rnorm(10, 0, 1)
rnorm(5, 100,1)
rnorm(5, 100, 10)



