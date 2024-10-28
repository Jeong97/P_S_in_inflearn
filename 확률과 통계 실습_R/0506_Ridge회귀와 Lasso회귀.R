#
# Ridge 회귀 & Lasso 회귀.
#

# 준비 및 데이터 불러오기. 
rm(list=ls())                       # 변수 클린.
dat <- mtcars

#
# MASS 패키지 활용한 Ridge.
#
library(MASS)
reg0 <- lm(mpg~.,dat)
coefficients(reg0)

lambda_range <- 10^seq(2, -1, -.1)
lambda_range
reg_ridge0 <- lm.ridge(mpg~.,dat,lambda=lambda_range)
plot(reg_ridge0)                     # 람다가 커지면서 계수는 감소합니다.
select(reg_ridge0)                   # HKB, LW는 람다를 측정하는 방법입니다. GCV = Generalized Cross Validation.

# 람다가 커질수록 계수가 억제됨.
reg_ridge <- lm.ridge(mpg~.,dat,lambda=2)
reg_ridge

reg_ridge <- lm.ridge(mpg~.,dat,lambda=100)
reg_ridge

reg_ridge <- lm.ridge(mpg~.,dat,lambda=10000)
reg_ridge

#
# glmnet 패키지 활용한 Ridge와 Lasso.
#
library(glmnet)

# Ridge 회귀. alpha = 0.
reg_ridge <- glmnet(as.matrix(dat[,-1]), dat[,1], family="gaussian", alpha=0) 

plot(reg_ridge0)
plot(reg_ridge,xvar="lambda")

lambda_range <- 10^seq(2, -1, -.1)
reg_ridge.cv <- cv.glmnet(as.matrix(dat[,-1]), dat[,1], family="gaussian", alpha=0, lambda=lambda_range)
reg_ridge.cv$lambda.min                   # The best lambda.                                                                

reg_ridge <- glmnet(as.matrix(dat[,-1]), dat[,1], family="gaussian", alpha=0, lambda = 3.16) 
coefficients(reg_ridge)

# Lasso 회귀. alpha = 1.
reg_lasso <- glmnet(as.matrix(dat[,-1]), dat[,1], family="gaussian", alpha=1)
plot(reg_lasso,xvar="lambda")
lambda_range <- 10^seq(0.5, -2, -0.1)
reg_lasso.cv <- cv.glmnet(as.matrix(dat[,-1]), dat[,1], family="gaussian", alpha=1, lambda=lambda_range) 
reg_lasso.cv$lambda.min                   # The best lambda.                                                                

reg_lasso <- glmnet(as.matrix(dat[,-1]), dat[,1], family="gaussian", alpha=1, lambda = 0.063) 
coefficients(reg_lasso)

# In-sample MSE 비교.
y <- dat[,1]
y_hat <- predict(reg0,dat[,-1])
mse_0 <- mean((y-y_hat)^2)
mse_0

y_hat <- predict(reg_ridge, as.matrix(dat[,-1]))
mse_ridge <- mean((y-y_hat)^2)
mse_ridge

y_hat <- predict(reg_lasso, as.matrix(dat[,-1]))
mse_lasso <- mean((y-y_hat)^2)
mse_lasso

