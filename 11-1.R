###산점도
#1. 두 변수 사이의 산점도
wt <- mtcars$wt #중량 자료
mpg <- mtcars$mpg #연비 자료
plot(wt, mpg, #2개 변수(x축, y축)
           main="자동차 중량-연비 그래프", #제목
           xlab="중량(1000lbs)", #x축 레이블
           ylab="연비(MPG)", #y축 레이블
           col="red", #point의 color
           pch=19) #point의 모양(값에 따라 다름) 

#2. 여러 변수들 간의 산점도
vars <- c("mpg","disp","drat","wt") #대상 변수 
target <- mtcars[,vars]
head(target)
dim(target)
pairs(target, #대상 데이터
            main="다변수 산점도") 

#3. 그룹 정보가 있는 두 변수의 산점도
head(iris)
table(iris$Species)

iris.2 <- iris[,3:4] #데이터 준비 

is.factor(iris$Species)
point <- as.numeric(iris$Species) #점의 모양
point
color <- c("red","green","blue") #점의 색깔 
plot(iris.2,
            main="Iris plot",
            pch=c(point),
            col=color[point]) #종에 다라 색깔 다르게 

###상관분석
#음주 정도와 혈중알코올농도의 상관성 조사
beers=c(5,2,9,8,3,7,3,5,3,5) #자료 입력 
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers,bal) #데이터프레임 생성 
tbl
plot(bal~beers,data=tbl) #산점도 
res <- lm(bal~beers,data = tbl) #회귀식 도출 
abline(res) #회귀선 그리기 
res
cor(beers,bal) #상관계수 계산 

#4개 변수 간 상관성 분석
cor(iris[,1:4])

###선 그래프
#월별 지각생 통계 선그래프 그리기
month=1:12 
late=c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month, late,
                 main = "지각생 통계", #제목
                 type = "l", #그래프의 종류 선택(알파벳)
                 lty=1, #선의 종류 선택
                 lwd=1, #선의 굵기 선택
                 xlab="Month", 
                 ylab="Late cnt")

#월별 지각생 통계 복수의 선그래프 작성
month=1:12 
late1=c(5,8,7,9,4,6,12,13,8,6,6,4)
late2=c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late1,
                  main = "Late Students",
                  type="b",
                  lty=1,
                  col="red",
                  xlab="Month",
                  ylab="Late cnt",
                  ylim=c(1,15)) #y축 값의 하한, 상한 
lines(month, late2,
                   type="b", 
                   col="blue")

late3=c(1,6,5,8,7,8,10,13,6,3,7,3)
lines(month, late3,
                   type="b", 
                   col="purple")

###자료의 탐색 실습
#Boston Housing 데이터셋 탐색적 데이터 분석
install.packages("mlbench")
