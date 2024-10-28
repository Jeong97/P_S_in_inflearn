#
# 잔차와 레버리지.
#

# 다음 R의 내장 데이터 사용.
head(mtcars,5)

dat <- mtcars
reg <- lm(mpg~am+wt+qsec, dat)

# 잔차와 레버리지 시각화.
par(mfrow=c(2,2))
plot(reg)
par(mfrow=c(1,1))

# 잔차만 시각화.
plot(residuals(reg))

