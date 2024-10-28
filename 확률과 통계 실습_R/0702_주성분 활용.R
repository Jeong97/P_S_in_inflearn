#
# 주성분 활용: 고차원 클러스터의 최적 시각화.
#

# 준비 및 데이터 불러오기. 
rm(list=ls())                       # 변수 클린.
dat <- read.csv("./data/data_male_physical_measurements.csv",header=T)
names(dat)

# k-means 군집화 해 둔다.
obj <- kmeans(dat,3,iter.max = 20)        # 3개의 군집.
cluster_n <- obj$cluster
table(cluster_n)

# 함수 정의.
# X_i 와 X_j를 축으로 사용한 시각화.
show_me3 <- function(dt,clustern,i,j)
{
  plot(dt[,i],dt[,j],type="n")  
  points(dt[clustern==1,i],dt[clustern==1,j],col="green")
  points(dt[clustern==2,i],dt[clustern==2,j],col="blue")
  points(dt[clustern==3,i],dt[clustern==3,j],col="red")
}

# PC_1과 PC_2를 축으로 사용한 시각화.
show_me_optimum <- function(dt,clustern)
{
  obj <- princomp(dt, cor=T)
  z <- obj$scores                         # Transformed Scores.
  plot(z[,1],z[,2],type="n",xlab="PC1", ylab="PC2") 
  points(z[clustern==1,1],z[clustern==1,2],col="green")
  points(z[clustern==2,1],z[clustern==2,2],col="blue")
  points(z[clustern==3,1],z[clustern==3,2],col="red")
}

# 실행.
# X1 vs X2
show_me3(dat,cluster_n,1,2)

# X1 vs X3
show_me3(dat,cluster_n,1,3)

# X3 vs X4
show_me3(dat,cluster_n,3,4)

# PC1 vs PC2
show_me_optimum(dat,cluster_n)

