#
# 구간추정.
#

# 표본으로 모평균의 신뢰구간을 계산해 본다.
x <- c(25,24,24,27,29,31,28,24,25,26,25,18,30,28,23,26,27,23,16,20,22,22,25,24,24,25,25,27,26,30,25,25,26,26,25,24)
n <- length(x)                                                               # 36.
n

x_mean <- mean(x)                   # 표본평균.
SEM <- sd(x)/sqrt(n)                # 표준오차 (Standard Error of the Mean).

# 90% 신뢰구간
ConfInt90 <- data.frame(low=x_mean-qt(0.95,n-1)*SEM,high=x_mean+qt(0.95,n-1)*SEM)   # 스튜던트 t.
ConfInt90
t.test(x, conf.level = 0.9)$conf.int

# 95% 신뢰구간
ConfInt95 <- data.frame(low=x_mean-qt(0.975,n-1)*SEM,high=x_mean+qt(0.975,n-1)*SEM)         # 스튜던트 t.
ConfInt95
t.test(x, conf.level = 0.95)$conf.int

# 99% 신뢰구간
ConfInt99 <- data.frame(low=x_mean-qt(0.995,n-1)*SEM,high=x_mean+qt(0.995,n-1)*SEM)         # 스튜던트 t.
ConfInt99
t.test(x, conf.level = 0.99)$conf.int

