##분반별 성적 csv 파일 불러오기
c1 <- read.csv('빅데이터분석 01분반.csv', header = T, fileEncoding = 'UCS-2LE')
c1 <- c1[,c(1,4)] #1번째(No), 4번째 (중간시험 성적) 열만 c1에 저장하기
names(c1) <- c("ID","mid") #열 이름 ID, mid로 바꾸기
c1
hist(c1$mid,10) #중간시험 성적을 히스토그램으로 시각화하기

c2 <- read.csv('빅데이터분석 02분반.csv', header = T, fileEncoding = 'UCS-2LE')
c2 <- c2[,c(1,4)]
names(c2) <- c("ID","mid")
c2
hist(c2$mid,10)

c3 <- read.csv('빅데이터분석 03분반.csv', header = T, fileEncoding = 'UCS-2LE')
c3 <- c3[,c(1,4)]
names(c3) <- c("ID","mid")
c3
hist(c3$mid,10)

table(c1$mid)
