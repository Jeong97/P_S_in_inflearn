# 
# 도수분포표와 분할표.
#

library(ggplot2)                              # 처음 사용하기 전 설치 필요.

# 데이터를 불러옵니다.
df <-read.csv("./data/data_students.csv", header=T, stringsAsFactors=T)
head(df)
df$bloodtype
df$gender

# 혈액형 도수분포표를 만들어 봅니다.
Freq1 <- table(df$bloodtype)
Freq1

# 성별 도수분포표를 만들어 봅니다.
Freq2 <- table(df$gender)
Freq2

# 도수분포표의 시각화.
ggplot(df, aes(x=bloodtype,fill=bloodtype)) + geom_bar()
ggplot(df, aes(x=gender, fill=gender)) + geom_bar()

# 혈액형 대 성별 분할표를 만들어 봅니다.
Freq3 <- table(df$bloodtype, df$gender)
Freq3

Freq4 <- xtabs(~bloodtype + gender, data=df)                  # Formula 식을 사용합니다.
Freq4

# 합(margin)을 구합니다.
addmargins(Freq3)
Freq1
Freq2

# 분할표의 시각화.
ggplot(df, aes(x=bloodtype, fill=gender)) + geom_bar()
ggplot(df, aes(x=bloodtype, fill=gender)) + geom_bar(position="dodge", width=0.5)     # 막대 서로 피함.



