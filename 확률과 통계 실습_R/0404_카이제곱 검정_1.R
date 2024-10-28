#
# 단변량 카이제곱 검정: 적합도 검정.
#

# 머리카락색과 눈동자 색 데이터 테이블 (남녀 구분)
HairEyeColor

#
# 눈동자 색으로 요약.
#

eye <- margin.table(HairEyeColor,2)
eye
class(eye)

# 적합도 검정. Default 모형과 비교.
chisq.test(eye)                               # Default 모형과 유의한 차이!
chisq.test(eye,p=c(0.25,0.25,0.25,0.25))      # Default 모형과 비교 검정!

sum((eye-mean(eye))^2/mean(eye))              # 통계량 계산하여 확인.

# 적합도 검정. 임의의 모형과 비교.
chisq.test(eye,p=c(0.41,0.32,0.15,0.12))      # 실제 알려진 모형 적용.

#
# 머리카락 색으로 요약.
#
hair <- margin.table(HairEyeColor,1)
hair
class(hair)
chisq.test(hair)                              # Default 모형과 유의한 차이!



