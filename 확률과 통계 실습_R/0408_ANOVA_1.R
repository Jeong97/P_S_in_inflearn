#
# 일원 분산분석 (ANOVA).
#

# 다음 세반의 성적 데이터가 있다. 
# 서로 의미있는 차이가 있는지 검정하여라.
x1 <- c(82,93,61,74,69,70,53)
x2 <- c(71,62,85,94,78,66,71)
x3 <- c(64,73,87,91,56,78,87)

lst <- list(a=x1, b=x2, c=x3)
stacked <- stack(lst)
colnames(stacked) <- c('score','class')
stacked

anova_result <- aov(score~class, data=stacked)
summary(anova_result)                # 가설검정 결과를 정리해서 보여줌.
test_stat <- 44.33/156.25
1 - pf(test_stat,2,18)               # Check.
TukeyHSD(anova_result)               # 짝을 지어서 결과를 재가공 (사후검정).

