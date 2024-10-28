#
# 선형회귀: Francis Galton의 데이터.
#

# 필요한 패키지 설치.
# install.packages("UsingR")
# install.packages("reshape2")
library(UsingR)                               # 처음 사용하기 전 설치 필요.
library(reshape2)                             # 처음 사용하기 전 설치 필요.

# 준비 및 데이터 불러오기. 
head(galton)
str(galton)

plot(child ~ parent, galton)                  # Not good!
reg <- lm(child ~ parent, data=galton)        # 집계하기 전에 미리  모형을 만들어 놓는다.

tab <- table(galton$child, galton$parent)     # 연속형 변수이지만 반복이 많음.
tab

df <- melt(tab)
colnames(df) <- c("child","parent","freq")
head(df)
attach(df)
plot(parent, child, cex = 0.05*freq, col="blue", pch=20)
abline(reg,col="red",lwd=1)
detach(df)

# 모델링 결과 요약.
summary(reg)
coefficients(reg)
summary(reg)$r.squared
mse <- mean(residuals(reg)^2)
mse


