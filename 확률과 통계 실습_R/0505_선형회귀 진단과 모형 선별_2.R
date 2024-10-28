#
# 선형회귀 모형의 선별과 예측: 보스톤 부동산 데이터.
#

# 준비 및 데이터 불러오기. 
# 1970년 보스톤 인근 housing 가격 데이터.
# 데이터 소스: http://lib.stat.cmu.edu/datasets/boston
df <- read.csv("./data/data_boston.csv",stringsAsFactors = T, header=T)   
head(df)
str(df)

# 선형 회귀.
reg <- lm(PRICE ~ ., df)
reg$coefficients
summary(reg)
AIC(reg)

#선형회귀 모형의 최적화
reg_opt <- step(reg, direction="both")          # AIC를 최소화 하는 방향으로 모형 최적화.
reg_opt$coefficient
summary(reg_opt)                                 
AIC(reg_opt)                                    # AIC는 작을수록 좋습니다.

# 다음과 같이 새로운 관측치 데이터가 있다.
# CRIM     : 0.03
# ZN       : 0.0
# CHAS     : 0.0
# NOX      : 0.4
# RM       : 4.3
# DIS      : 1.9
# RAD      : 1.0
# TAX      : 273.0
# PTRATIO  : 18.0 
# B        : 380.0
# LSTAT    : 7.5
# 그러면 가격은?

new_obs <- data.frame(matrix(nrow=0,ncol=11))
new_obs <- rbind(new_obs,c(0.03, 0.0, 0.0, 0.4, 4.3, 1.9, 1.0, 273.0, 18.0, 380.0, 7.5))
coeffs <- reg_opt$coefficient
colnames(new_obs) <- names(coeffs)[-1]                # 절편을 제외한 나머지 이름.
new_obs

print(paste("Forecast: ", round(predict(reg_opt, new_obs),3)))
      
