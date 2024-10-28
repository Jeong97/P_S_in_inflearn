#
# 비모수 검정.
#

# 필요한 패키지 설치.
# install.packages("EnvStats")            # qqPlot 함수 제공.   
library(EnvStats)                         # 처음 사용하기 전 설치 필요.

#
# Mann-Whitney U 검정.
#
score_male <- c(100, 80)
score_female <- c(95, 75, 68)

# paired=F => Mann-Whitney U 검정.
# correct=F => 정규분포로 근사하지 않음.
wilcox.test(score_male, score_female, paired=F, correct=F)
# => 결론: 순위 평균에는 차이 없다. 

#
# Wilcoxon 검정 (부호화된 순위 검정).
#
x <- c(5.5, 1, 10, 16, 13, 8, 9)
y <- c(4.5, 17, 6, 14, 11, 5, 9)

# paired=T => Wilcoxon 검정.
# exact=F => 타이도 허용.
# correct=F => 정규분포로 근사하지 않음.
wilcox.test(x, y, paired=T, exact=F,  correct=F) 
# => 결론: 순위 평균에 차이 없다. 

#
# Shapiro-Wilk 검정 (정상성 검정)
#
x1 <- rnorm(500, 5, 10)          # n=500, mu=5, sigma=10. 정규분포.
x2 <- rt(500, 3)                 # n=500, 자유도(df)=3. Student t 분포.
qqPlot(x1, distribution = "norm", add.line=T)  # QQ Plot 시각화. 
qqPlot(x2, distribution = "norm", add.line=T)  # QQ Plot 시각화. 
shapiro.test(x1)                 # 귀무가설 유지 => 정규분포 확인.
shapiro.test(x2)                 # 귀무가설 기각 => 정규분포 아님.
