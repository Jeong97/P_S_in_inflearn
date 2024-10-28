#
# 시각화: 비교와 상관관계 확인의 용도.
# 미국 대기오염 (초미세 먼지 농도 pm25) 데이터 사용.
#

df <- read.csv("./data/data_airquality.csv",stringsAsFactors = T, header=T)   
head(df)

# 다중 boxplot.
boxplot(pm25 ~ region, data=df, col="green" )                    # Formula 사용!
boxplot(pm25 ~ region, data=df, col="blue", horizontal=TRUE )    # Formula 사용!
plot(df$region, df$pm25, col="red")                              # plot() 함수 사용! X = 명목형 변수.
title("Multi Boxplot")

# 다중 histogram.
par()                                                            # 시각화 파라미터.
par()$mfrow                                                      # 파라미터 mfrow.
par()$mar                                                        # 파라미터 mar.
mfrow_old <- par()$mfrow                                         # 현 파라미터 저장.
mar_old <- par()$mar                                             # 현 파라미터 저장.
par(mfrow=c(2,1), mar = c(4,4,2,1))                              # 시각화 파라미터 설정. 세로=2 & 가로=1.
subset(df, subset=(region=="east"))                              # subset 동부.
subset(df, subset=(region=="west"))                              # subset 서부.
hist(subset(df, subset=(region=="east"))$pm25, col = "green",main="East", xlab="pm2.5",xlim=c(0,20),breaks=20)    # 동부 histogram.
hist(subset(df, subset=(region=="west"))$pm25, col = "green",main="West", xlab="pm2.5",xlim=c(0,20),breaks=20)    # 서부 histogram.
par(mfrow=mfrow_old, mar=mar_old)                                # 시각화 파라미터 원상복구.

# 산점도.
plot(df$latitude, df$pm25)                                       # 위도 vs pm25.
abline(h = 10, lwd = 2, lty = 2, col = "red")                    # 세로 점선. 10 이상이면 높음. 

with(df, plot(latitude,pm25))                                    # with() 사용.
abline(h = 10, lwd = 2, lty = 2, col = "red")                    # 세로 점선. 10 이상이면 높음. 

with(df, plot(pm25~latitude))                                    # Formula 사용.
abline(h = 10, lwd = 2, lty = 2, col = "red")                    # 세로 점선. 10 이상이면 높음. 

df2 <- data.frame(df$latitude, df$pm25)                          # 두개의 변수로 이루어진 data frame.
plot(df2)                                                        # data frame 직접 사용.
abline(h = 10, lwd = 2, lty = 2, col = "red")                    # 세로 점선. 10 이상이면 높음. 

# 컬러사용 산점도.
with(df, plot(latitude,pm25,col=region))                         # with() 사용.
abline(h = 10, lwd = 2, lty = 2, col = "blue")                   # 세로 점선. 10 이상이면 높음. 

with(df, plot(latitude,pm25,col=region,pch=as.integer(region)))  # 컬러와 다른 character 사용.
abline(h = 10, lwd = 2, lty = 2, col = "blue")                   # 세로 점선. 10 이상이면 높음. 

# 다중 산점도.
mfrow_old <- par()$mfrow                                         # 현 파라미터 저장.
mar_old <- par()$mar                                             # 현 파라미터 저장.
par(mfrow=c(1,2), mar = c(5,4,2,1))                              # 시각화 파라미터 설정. 세로=1 & 가로=2.
with(subset(df, subset=(region=="east")),plot(latitude,pm25,main="East",ylim=c(0,20),xlim=c(20,70)))
with(subset(df, subset=(region=="west")),plot(latitude,pm25,main="West",ylim=c(0,20),xlim=c(20,70)))
par(mfrow=mfrow_old, mar=mar_old)                                # 시각화 파라미터 원상복구.

# 출력.
dev.copy(png, file = "graph2.jpg")
dev.off()

# 산점도 행렬.
df3 <- data.frame(df$latitude, df$longitude, df$pm25)            # 세개의 변수로 이루어진 data frame.
plot(df3)  

