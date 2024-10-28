#
# 선형회귀 진단과 모형 선별.
#

# 준비 및 데이터 불러오기. 
# install.packages("car")
library(car)                       # 처음 사용하기 전 설치 필요. vif 함수 제공.

rm(list=ls())                      # 변수 클린.
?mtcars
head(mtcars)
dim(mtcars)
n <- dim(mtcars)[1]

# step()함수 사용 모형 최적화.
# 정보량 AIC의 최소화.
reg_start <- lm(mpg ~ . ,data=mtcars)
step(reg_start, direction="both")

reg <- lm(mpg ~ wt + qsec + am, mtcars)
summary(reg)
summary(reg)$r.squared             # R^2.
mean(summary(reg)$resid^2)         # MSE
AIC(reg)/n                         # AIC

# 분산 인플레 요인 (VIF) 계산.
vif(reg)



