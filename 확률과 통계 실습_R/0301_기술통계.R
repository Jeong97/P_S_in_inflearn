#
# 다양한 기술 통계값 구하기.
#

# 데이터를 읽어온다.
df <- read.csv("./data/data_students.csv", header=T, stringsAsFactors = T)   
head(df,5)
dim(df)

# 다양한 기술 통계값을 계산해 본다.
mean(df$height)                       # 평균.
median(df$height)                     # 중위수.
range(df$height)
quantile(df$height)                   # 사분위수.
quantile(df$height, 0.1)              # 분위수.
quantile(df$height, 0.95)             # 분위수.
IQR(df$height)                        # IQR.
summary(df$height)                    # 요약.
boxplot(df$height)                    # 상자 그림.
fivenum(df$height)		                # 5 number summary.

var(df$height)                        # 분산.
sd(df$height)                         # 표준편차. 
sqrt(var(df$height))                  # 표준편차는 분산의 제곱근.
cov(df$height, df$weight)             # 공분산.
cor(df$height, df$weight)                                 # 상관계수. 
cov(df$height, df$weight)/(sd(df$height)*sd(df$weight))   # 공분산과 상관계수의 관계.
round(cor(df[,c(3,7,8)]),2)                               # 상관계수행렬 계산.

