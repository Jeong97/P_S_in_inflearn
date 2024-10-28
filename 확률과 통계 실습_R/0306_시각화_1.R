#
# 시각화: 단변량 기술통계 요약.
# 미국 대기오염 (초미세 먼지 농도 pm25) 데이터 사용.
#

df <- read.csv("./data/data_airquality.csv",stringsAsFactors = T, header=T)   
head(df)
str(df)
summary(df$pm25)

# boxplot 기본.
boxplot(df$pm25)
boxplot(df$pm25, col = "red")
boxplot(df$pm25, col = "green", notch = TRUE)
boxplot(df$pm25, col = "blue", notch = TRUE, horizontal=TRUE)

# histogram 기본.
hist(df$pm25, col="red")
hist(df$pm25, col="green")
rug(df$pm25)

hist(df$pm25, col="green", breaks=10)                  # N# of bins = 10.
rug(df$pm25)

# histogram + 오버레이.
hist(df$pm25, col="green", breaks=100)                  # N# of bins = 100. (계급의 갯수).
abline(v = 12, lwd = 2)                                 # 수직 라인. 
abline(v = median(df$pm25), col = "magenta", lwd = 3)   # 중앙값에 분홍색 수직라인.

# barplot 기본.
tab <- table(df$region)                                  # 도수분포표 만들기.
tab
barplot(tab, col = "wheat", main = "Region Distribution")
title( xlab="Region",ylab="Frequency")

# 파이 차트.
my_labels <- names(tab)
pie(tab, labels= my_labels, col=c("magenta","blue"))

# 출력.
dev.copy(png, file = "graph1.png")
dev.off()



