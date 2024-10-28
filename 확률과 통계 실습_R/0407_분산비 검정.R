#
# 분산비 검정.
#

# 데이터를 시뮬레이션하여 준비한다.
set.seed(1234)
n1 <- 30
n2 <- 40
n3 <- 50
x1 <- rnorm(n1,10, 2)                         # mu=10, sigma=2 데이터 생성.  
x2 <- rnorm(n2,-5, 4)                         # mu=-5, sigma=4 데이터 생성.  
x3 <- rnorm(n3,50, 2)                         # mu=50, sigma=2 데이터 생성.  

# 분산비검정: var.test() 함수 사용.
var.test(x1,x2)
var.test(x2,x1)
var.test(x2,x1,alternative = "greater")
var.test(x2,x1,alternative = "less")

var.test(x1,x3)
var.test(x1,x3,alternative="greater")
var.test(x1,x3,alternative="less")


