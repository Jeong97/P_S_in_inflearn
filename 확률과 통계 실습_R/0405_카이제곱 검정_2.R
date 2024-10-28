#
# 이변량 카이제곱 검정: 독립성 검정. 
#

# 머리카락색과 눈동자 색 분활표 (남녀 구분)
HairEyeColor

tab_male <- HairEyeColor[,,"Male"]          # 남자 테이블.
tab_male
tab_female <- HairEyeColor[,,"Female"]      # 여자 테이블.                     
tab_female
tab_combo <- tab_male + tab_female          # 남녀 합계.
tab_combo

# 눈색과 머리카락색의 독립성 검정.  =>  분활표 카이제곱검정.
# H0: 두 명목형 변수는 독립적이다.
# H1: 두 명목형 변수는 독립적이지 않다.

chisq.test(tab_combo)
chisq.test(tab_combo)$expected       # OK.

#
# 또다른 예). 타이타닉호의 객실 등급을 나타내는 변수와 생존여부를 나타내는 변수사이의 독립성 검정.
# 
dat <- matrix(c(122,167,528,673,203,118,178,212),ncol=2,byrow=F)
rownames(dat) <- c("1등실","2등실","3등실","승무원")
colnames(dat) <- c("생존", "사망")
dat
chisq.test(dat)



