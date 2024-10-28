#
# 상관성 분석 - PART 1.
# 상관계수 계산.
#

# install.packages("corrgram")
library(corrgram)                                   # 처음 사용하기 전 설치 필요.
options(warn=-1)                                    # 성가신 경고는 off.

View(iris)                                          # 붓꽃 데이터.
dat <- iris[,-5]
X <- iris$Petal.Length
Y <- iris$Sepal.Length

# 피어슨 상관계수.
round(cor(dat),2)                                   # 상관계수 행렬.
cor(X,Y, method="pearson")
corrgram(dat, order=F, main="Pearson", upper.panel=panel.cor) # 시각화. 

# 스피어맨 상관계수.
round(cor(dat,method="spearman"),2)
cor(X,Y,method="spearman")
corrgram(dat, order=F, main="Spearman", cor.method="spearman", upper.panel=panel.cor) # 시각화. 

# 켄달 순위 상관계수.
round(cor(dat,method="kendall"),2)
cor(X,Y,method="kendall")
corrgram(dat, order=F, main="Kendall", cor.method="kendall", upper.panel=panel.cor) # 시각화. 

