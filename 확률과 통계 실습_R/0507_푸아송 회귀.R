#
# 푸아송 회귀.
#

library(ggplot2)                               # 처음 사용하기 전 설치 필요.
# 데이터 읽어오기.
dat <- read.csv("./data/data_awards.csv")
head(dat)
str(dat)

# num_awards : 1년동안 학생(고교)이 받은 상의 수 (count!!).
# prog       : 고등학교 프로그램 (미국): "Academic", "General", "Vocational".
# math       : 수학점수.

# 시각화.
ggplot(dat, aes(num_awards, fill = prog)) +  geom_histogram(binwidth = 0.5, position="dodge")

# 푸아송 회귀 모형 만들기.
reg <- glm(num_awards ~ prog + math, family="poisson", data=dat)
summary(reg)

# 예측에 활용.
X_new <- data.frame(prog = factor("Academic", levels=c("Academic","General","Vocational")), math =70 )
predict(reg, X_new, type="response")

# 예측선 그리기.
X_math <- seq(30,80,1)
prog_var <- factor(c("Academic","General","Vocational"))

par(mfrow=c(1,3))
for(i in 1:3){
  X_new <- X_new <- data.frame(prog = prog_var[i], math = X_math )
  Y_hat <- predict(reg, X_new, type="response")
  dat1 <- dat[dat$prog==as.character(prog_var[i]),]
  plot(dat1$math, dat1$num_awards, col="green",pch=20, main=as.character(prog_var[i]))
  lines(X_math, Y_hat, col="red")
}
par(mfrow=c(1,1))

