#
# 주성분 분석. 
# 남성 신체검사 데이터 할용.
#

# 준비 및 데이터 불러오기. 
rm(list=ls())                       # 변수 클린.
dat <- read.csv("./data/data_male_physical_measurements.csv",header=T)
dim(dat)
names(dat)
View(dat)
summary(dat)

# 데이터 행렬을 사용한 SVD 방법으로 주성분을 구한다.
obj1 <- prcomp(dat, center=T, scale=T)
obj1$sdev^2                         # 분산.
obj1$rotation                       # Loading 벡터.
obj1$x                              # Transformed Scores.
dim(obj1$x)
colnames(obj1$x)
obj1$x[1,]
round(cor(obj1$x),2)                # 상관계수 행렬. 1 대각행렬!
summary(obj1)                       # 누적 분산.

# 상관계수 행렬을 사용한 ED 방법으로 주성분을 구한다.
round(cor(dat),2)                   # 상관계수 행렬.
obj2 <- princomp(dat, cor=T)
obj2$sdev^2                         # 분산.
obj2$loadings                       # Loading 벡터.
obj2$scores                         # Transformed Scores.
dim(obj2$scores)
colnames(obj2$scores)
obj2$scores[1,]
round(cor(obj2$scores),2)           # 상관계수 행렬. 1 대각행렬!
summary(obj2)                       # 누적 분산.

# 직교관계 확인. (내적 계산)
pc <- as.matrix(obj2$loadings)
pc[,1] %*% pc[,1]
pc[,5] %*% pc[,5]
pc[,1] %*% pc[,5]
pc[,3] %*% pc[,8]
pc[,2] %*% pc[,7]


