#
# R의 확률 함수: 이산확률
#

#
# dxxx() : 확률분포함수. xxx = 확률분포의 명칭.
# pxxx() : 누적확률.
# qxxx() : 분위수.
# rxxx() : 랜덤넘버.
#

#
# 베르누이.
#

# 누적확률.
# size 즉 n을 1로 설정해서 이항이 아닌 베르누이 확률을 만든다.
pbinom(0,size=1,prob=0.5)          
pbinom(1,size=1,prob=0.5)         

pbinom(0,size=1,prob=0.3)         
pbinom(1,size=1,prob=0.3)         

pbinom(0,size=1,prob=0.7)         
pbinom(1,size=1,prob=0.7)         

# 분위수.
qbinom(0.1,size=1,prob=0.5)       
qbinom(0.9,size=1,prob=0.5)

# 랜덤넘버 생성.
rbinom(20,size=1,prob=0.5)
rbinom(20,size=1,prob=0.1)
rbinom(20,size=1,prob=0.9)

#
# 이항.
#

# 확률분포함수를 시각화 해본다.
x <- seq(0,20)
plot(x, dbinom(x,size=20,prob=0.5), pch=19,col="blue")
plot(x, dbinom(x,size=20,prob=0.7), pch=19,col="red")
plot(x, dbinom(x,size=20,prob=0.3), pch=19,col="green")

# 누적확률.
pbinom(5,size=20,prob=0.5)
pbinom(10,size=20,prob=0.5)
pbinom(15,size=20,prob=0.5)
pbinom(20,size=20,prob=0.5)

# 분위수.
qbinom(0.5,size=20,prob=0.5)
qbinom(0.5,size=20,prob=0.7)

# 랜덤넘버 생성.
rbinom(10,size=20,prob=0.5)
rbinom(10,size=20,prob=0.3)

#
# 푸아송.
#

# 확률분포함수를 시각화 해본다.
x <- seq(0,20)
plot(x, dpois(x,lambda=1), pch=19,col="blue")
plot(x, dpois(x,lambda=2), pch=19,col="red")
plot(x, dpois(x,lambda=4), pch=19,col="green")
plot(x, dpois(x,lambda=8), pch=19,col="magenta")

# 누적확률.
ppois(1,lambda=3)
ppois(3,lambda=3)
ppois(4,lambda=3)

# 분위수.
qpois(0.5,lambda=2)
qpois(0.5,lambda=4)
qpois(0.5,lambda=8)

# 랜덤넘버 생성.
rpois(20,lambda=2)
rpois(20,lambda=4)
rpois(20,lambda=8)

