#
# 분산검정, 분산의 신뢰구간.
#

# 필요한 패키지 설치.
# install.packages("EnvStats")            # varTest 함수 제공. 
library(EnvStats)                         # 처음 사용하기 전 설치 필요.

# 한개의 표본을 시뮬레이션하여 구한다.
set.seed(1234)
n <- 20
x <- rnorm(n,10,2)                        # mu=10, sigma=2 데이터 생성.  
ssq <- var(x)                             # 표본의 분산. 

# 분산검정 #1.
# 양측검정의 채택역 설정하여 비교.
sigmasq <- 2^2                            # 비교 대상 분산. 
test_stat <- (n-1)*ssq/sigmasq            # 검정통계량 (이론 수식 참고).
test_stat
the_range <- data.frame(low = qchisq(0.025,n-1), high=qchisq(0.975,n-1))
the_range

# 분산검정 #2.
# p-value 사용: varTest() 함수 사용 & 수식사용 비교.

# 우측검정. 
varTest(x, alternative = "greater", sigma.squared = sigmasq)$p.value
p_value1 <- 1 - pchisq(test_stat,n-1)
p_value1

# 좌측검정. 
varTest(x, alternative = "less", sigma.squared = sigmasq)$p.value
p_value2 <- pchisq(test_stat,n-1)
p_value2

# 양측검정.
varTest(x, sigma.squared = sigmasq)$p.value
p_value <- 2*p_value1    # test_stat > (n-1) 이면 2*p_value1, 아니면 2*p_value2
p_value

# 분산의 신뢰구간 (95%). 이론 수식 참고!
varTest(x, sigma.squared = sigmasq)$conf.int
conf_int <- data.frame(low = (n-1)*ssq/qchisq(0.975,n-1), high = (n-1)*ssq/qchisq(0.025,n-1)) 
conf_int

# 예). 
# 2022년도 애플의 1년간의 주식데이터를 가지고 계산해 보니,
# 월별 수익률 = 2.35%이고 월별 변동성 (표준편차)는 8.56%이다.
# 월별 변동성의 95% 신뢰구간을 구하여라.
n <- 12                             # 1 year = 12 months.
s <- 8.56                           # 표본의 표준편차.
ssq <- s^2                          # 표본의 분산.
conf_int_ssq <- data.frame(low = (n-1)*ssq/qchisq(0.975,n-1),high = (n-1)*ssq/qchisq(0.025,n-1)) 
conf_int_ssq

conf_int_s <- sqrt(conf_int_ssq)
conf_int_s


