##분반별 중간고사 성적을 박스플롯으로 나타내기

a <- read.csv(file.choose(), encoding = 'UTF-8')
mid <- a[,4]
mid
boxplot(mid, main="01분반 중간점수")

b <- read.csv(file.choose(), encoding = 'UTF-8')
mid2 <- b[,4]
mid2
boxplot(mid2, main="02분반 중간점수")

c <- read.csv(file.choose(), encoding = 'UTF-8')
mid3 <- c[,4]
mid3
boxplot(mid3, main="03분반 중간점수")