#
# ��������.
#

# ǥ������ ������� �ŷڱ����� ����� ����.
x <- c(25,24,24,27,29,31,28,24,25,26,25,18,30,28,23,26,27,23,16,20,22,22,25,24,24,25,25,27,26,30,25,25,26,26,25,24)
n <- length(x)                                                               # 36.
n

x_mean <- mean(x)                   # ǥ�����.
SEM <- sd(x)/sqrt(n)                # ǥ�ؿ��� (Standard Error of the Mean).

# 90% �ŷڱ���
ConfInt90 <- data.frame(low=x_mean-qt(0.95,n-1)*SEM,high=x_mean+qt(0.95,n-1)*SEM)   # ��Ʃ��Ʈ t.
ConfInt90
t.test(x, conf.level = 0.9)$conf.int

# 95% �ŷڱ���
ConfInt95 <- data.frame(low=x_mean-qt(0.975,n-1)*SEM,high=x_mean+qt(0.975,n-1)*SEM)         # ��Ʃ��Ʈ t.
ConfInt95
t.test(x, conf.level = 0.95)$conf.int

# 99% �ŷڱ���
ConfInt99 <- data.frame(low=x_mean-qt(0.995,n-1)*SEM,high=x_mean+qt(0.995,n-1)*SEM)         # ��Ʃ��Ʈ t.
ConfInt99
t.test(x, conf.level = 0.99)$conf.int

