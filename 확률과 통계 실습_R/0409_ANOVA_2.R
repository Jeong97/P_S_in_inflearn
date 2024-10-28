#
# 이원 분산분석 (ANOVA w/o replication).
#

# 다음은 생산된 제품의 특성을
# 공정 A의 유형 (a1,a2,a3)과 공정 B의 유형 (b1,b2,b3,b4)으로
# 구분지어서 정리해 놓은 데이터이다.

df <- data.frame(measure=c(10,12,9,11,9,11,10,9,17,16,14,16), A=rep(c("a1","a2","a3"),each=4), B=rep(c("b1","b2","b3","b4"),3), stringsAsFactors = T)
df
p <- 3        					# A 유형의 가짓수.                              
q <- 4        					# B 유형의 가짓수.

anova_result <- aov(measure ~ A + B,data=df)
summary(anova_result)

# 위의 결과를 다시한번 확인해 본다.
test_stat <- 42.75/1.0833333
1 - pf(test_stat,p-1,(p-1)*(q-1))               # Check A.

test_stat <- 2.00/1.0833333
1 - pf(test_stat,q-1,(p-1)*(q-1))               # Check B.

# 결론: A의 유형에 의해서 구별되는 처리가 있다.
