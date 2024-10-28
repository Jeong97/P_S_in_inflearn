#
# t 검정과 모평균의 비교 (기초).
#

# 모집단이 하나인 경우 => t 검정.
set.seed(1234)
x <- rnorm(10,3,2)
boxplot(x)
t.test(x)                               # 0과 비교. 양측검정.
t.test(x, alternative="greater")        # 0과 비교. 우측검정.
t.test(x,mu=1)                          # 1과 비교. 양측검정.
t.test(x, alternative="greater", mu=1)  # 1과 비교. 우측검정.

# 모집단이 둘이며 독립적인 경우 => 독립표본 t 검정.
set.seed(1234)
x1 <- rnorm(10, 3, 3)
x2 <- rnorm(20, 5, 3)
boxplot(x1, x2)
t.test(x1,x2)                           # 그룹평균 비교. 양측검정.

# 모집단이 둘이며 서로 1대1 연결되어 있슴  => 대응표본 t 검정.
# 예). 임상 실험에서 같은 사람으로 이루어진 집단의 약 투여전/후의 수치 비교.
set.seed(1234)
x1 <- rnorm(10, 3, 5)
x2 <- x1 + rnorm(10,3,1)
boxplot(x1, x2)
t.test(x1,x2)                  # 그룹평균 비교. 귀무가설 유지.
t.test(x1,x2,paired=F)         # 그룹평균 비교. 귀무가설 유지.
t.test(x1,x2,paired=T)         # 그룹평균 비교. 귀무가설 기각!

