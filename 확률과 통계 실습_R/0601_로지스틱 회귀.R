#
# 로지스틱 회귀.
#

# install.packages("ROCR")
library("ROCR")                                # 처음 사용하기 전 설치 필요.

# 준비 및 데이터 불러오기. 
# UCLA가 제공하는 입학 합격 데이터. 
rm(list=ls())                       # 변수 클린.
dat <- read.csv("./data/data_admission.csv",header=T)
#
# admit = 합격 여부 (0 or 1)
# gre = GRE 성적.
# gpa = 학과 성적.
# rank = 등급. 낮을 수록 좋음.
#
dim(dat)
n <- dim(dat)[1]
head(dat,5)
summary(dat)

# 머신러닝 준비.
p <- 0.6                     # 60% 학습, 40% 예측.
set.seed(1234)
inTrain <- sample( 1:n, as.integer(n*p), replace=F)
dat_train <- dat[inTrain,]
dat_test <- dat[-inTrain,]
dim(dat_train)
dim(dat_test)

# 머신러닝 : 로지스틱 회귀.
modelFit <- glm(admit ~ ., data = dat_train, family = binomial(link="logit"))
summary(modelFit)

# p값이 큰 변수 제거.
modelFit <- glm(admit ~ . -gpa , dat_train, family = binomial(link="logit"))
summary(modelFit)

# 예측.
pred_prob <- predict(modelFit, newdata=dat_test,type="response")
pred_val <- ifelse(pred_prob > 0.2, 1, 0)

# 진단.
confusion_matrix <- table(pred_val, dat_test$admit)
confusion_matrix

accuracy <- (confusion_matrix[1,1] + confusion_matrix[2,2])/sum(confusion_matrix)   
sensitivity <- confusion_matrix[2,2]/(confusion_matrix[1,2] + confusion_matrix[2,2])   
specificity <- confusion_matrix[1,1]/(confusion_matrix[1,1] + confusion_matrix[2,1])
precision <- confusion_matrix[2,2]/(confusion_matrix[2,1] + confusion_matrix[2,2])  
accuracy
sensitivity 
specificity
precision                                                    # Positive predicted value.

# ROC plot 그리기.
pred_ROC <- prediction(pred_prob, dat_test$admit)
ROC_coords <- performance(pred_ROC, "tpr", "fpr")
plot(ROC_coords, xlim=c(0,1), ylim=c(0,1), col="red")

rm(list=ls())                       # 변수 클린.

