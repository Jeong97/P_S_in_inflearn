#
# 상관성 분석 - PART 2.
# 피어슨 상관계수의 신뢰구간.
#

# 데이터를 불러온다.
df <-read.csv("./data/data_students.csv", header=T, stringsAsFactors=T)
head(df,5)

X <- df$height
Y <- df$weight
n <- length(X)

# 신뢰구간 수식사용 계산.
r <- cor(X,Y)
r 
z <- atanh(r)                         # 피셔의 z 변환.
std_error_z <- 1/sqrt(n-3)

# 95% 신뢰구간.
data.frame(low=tanh(z-qnorm(0.975)*std_error_z), high=tanh(z+qnorm(0.975)*std_error_z))    # 95% 신뢰구간.  

# 99% 신뢰구간.
data.frame(low=tanh(z-qnorm(0.995)*std_error_z), high=tanh(z+qnorm(0.995)*std_error_z))    # 99% 신뢰구간.

# 신뢰구간 R 함수사용 계산.
cor.test(X,Y,conf.level = 0.95)$conf.int    # 95% 신뢰구간.
cor.test(X,Y,conf.level = 0.99)$conf.int    # 99% 신뢰구간.

