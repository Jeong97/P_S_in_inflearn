#
# t 검정과 모평균의 비교 (심화).
#

# sleep 내장 데이터 사용.
sleep
?sleep
dat <- sleep[,-3]

# group의 유형별 평균을 구해본다.
tapply(dat$extra, dat$group, mean)

# 분산비 검정 ==> 결과: 등분산.
var.test(extra~group, data=dat)                              

# 독립표본 전제하고 검정 ==> 결과: 그룹별 차이 없음.
t.test(extra~group, data=dat, paired=FALSE, var.equal=TRUE)  

# 대응표본 전제하고 검정 ==> 결과: 그룹별 차이 있음!
t.test(extra~group, data=dat, paired=TRUE, var.equal=TRUE)  

