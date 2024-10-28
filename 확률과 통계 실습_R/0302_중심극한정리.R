#
# 표본평균의 분포 (중심극한정리).
#

nt  <- 100000
mfrow_old <- par()$mfrow                          # 현재 파라미터 저장.
mar_old <- par()$mar                              # 현재 파라미터 저장.
par(mfrow=c(1,4), mar = c(4,4,2,1))               # 시각화 파라미터 설정. 세로=1 & 가로=4.
 
# 동전 (이항분포).
for(n in c(1,10,20,50)){
x <- sample(c(0,1),nt*n,replace=T)                # 랜덤넘버 생성.
m <- matrix(x,nrow=n,ncol=nt, byrow=F)            # 개개 컬럼 = 표본.
vals <- apply(m,2, mean)                          # 컬럼 평균을 구한다.
hist(vals,xlim=c(0,1),col="green",main = paste("n = ", n)) # 히스토그램.
abline(v=0.5,lwd=3,col="red")                     # 모집단의 평균 위치.
}

# 연속균등분포.
for(n in c(1,10,20,50)){
  x <- runif(nt*n,0,1)
  m <- matrix(x,nrow=n,ncol=nt, byrow=F)
  vals <- apply(m,2, mean)
  hist(vals,xlim=c(0,1),col="yellow",main = paste("n = ", n))
  abline(v=0.5,lwd=3,col="red")
}

# 표준정규분포.
for(n in c(1,10,20,50)){
  x <- rnorm(nt*n,0,1)
  m <- matrix(x, nrow=n, ncol=nt, byrow=F)
  vals <- apply(m,2, mean)
  hist(vals,xlim=c(-3,3),col="magenta",main = paste("n = ", n))
  abline(v=0,lwd=3,col="red")
}
par(mfrow=mfrow_old, mar=mar_old)                                # 시각화 파라미터 원상복구.
rm(list=ls())
