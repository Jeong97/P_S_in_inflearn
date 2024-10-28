#
# 명목형 변수와 선형회귀 모델링.
# 더미변수. 상호작용.
#

# 준비 및 데이터 불러오기. 
rm(list=ls())                       # 변수 클린.
df <- read.csv("./data/data_students.csv",header=T, stringsAsFactors=T )
dim(df)
names(df)

# 명목형 변수 불포함. 더미변수 없음.
# weight ~ height 수식 적용. 
reg1 <- lm(weight ~ height, df)
summary(reg1)
rsq1 <- summary(reg1)$r.squared
mse1 <- mean(residuals(reg1)^2)

attach(df)
plot(height, weight, col = gender, pch=20)
abline(reg1,col="blue",lwd=1)
detach(df)

# 더미변수 포함.
# weight ~ height + gender 수식 적용.
levels(df$gender)
reg2 <- lm(weight ~ height + gender, df)
summary(reg2)
rsq2 <- summary(reg2)$r.squared
mse2 <- mean(residuals(reg2)^2)

b0 = coefficients(reg2)[1]
b1 = coefficients(reg2)[2]
b2 = coefficients(reg2)[3]
x <- seq(150,190,2)

attach(df)
plot(height,weight, col = gender, pch=20)
lines(x, b0 + b1*x, col="blue")
lines(x, (b0 + b2) + b1*x, col="green")
detach(df)

# 상호작용 하는 더미변수.
# weight ~ height + gender + height:gender 수식 적용.
reg3 <- lm(weight ~ height + gender + height:gender, df)
summary(reg3)
rsq3 <- summary(reg3)$r.squared
mse3 <- mean(residuals(reg3)^2)

b0 = coefficients(reg3)[1]
b1 = coefficients(reg3)[2]
b2 = coefficients(reg3)[3]
b3 = coefficients(reg3)[4]

attach(df)
plot(height,weight, col = gender, pch=20)
lines(x, b0 + b1*x, col="blue")
lines(x, (b0 + b2) + (b1 + b3)*x, col="green")
detach(df)

# 지금까지의 R^2와 MSE 비교.
c(rsq1, rsq2, rsq3)                  # 증가!
c(mse1, mse2, mse3)                  # 감소!


