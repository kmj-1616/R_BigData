#데이터프레임 만들기
city <- c("Seoul","Tokyo","Washington")
rank <- c(1,3,2)
city.info <- data.frame(city,rank)
city.info

#iris 데이터셋
iris
iris[,c(1:2)] #1,2열
iris[,c(1,3,5)] #1,3,5열
iris[,c("Sepal.Length","Species")] #1,5열
iris[1:5,] #1~5행
iris[1:5,c(1:3)] #1~5행의 데이터 중 1,3열 데이터

dim(iris) #행과 열의 개수
nrow(iris) #행의 개수
ncol(iris) #열의 개수
colnames(iris) #열 이름 출력, names와 결과 동일
head(iris) #앞부분 일부
tail(iris) #뒷부분 일부

str(iris) #요약 정보
iris[,5] #품종 데이터 보기
unique(iris[,5]) #품종의 종류 보기(중복 제거)
table(iris[,"Species"]) #품종의 종류별 행의 개수 세기

#행별, 열별 합계와 평균 계산
colSums(iris[,-5]) #열별 합계
colMeans(iris[,-5]) #열별 평균
rowSums(iris[,-5]) #행별 합계
rowMeans(iris[,-5]) #행별 평균

#행과 열의 방향 전환
z <- matrix(1:20, nrow = 4, ncol = 5)
z
t(z) #행과 열 방향 전환

#조건에 맞는 행과 열의 값 추출
IR.1 <- subset(iris, Species=="setosa") #품종 열의 값이 setosa인 열만 추출
IR.1
IR.2 <- subset(iris, Sepal.Length >5.0 & Sepal.Width>4.0)
IR.2
IR.2[,c(2,4)] #2,4열의값만 추출

#매트릭스와 데이터프레임 산술연산
a <- matrix(1:20, 4,5)
b <- matrix(21:40, 4,5)
a
b

2*a #매트릭스 a에 저장된 값들에 2 곱하기 
b-5
2*a + 3*b

a+b
b-a
b/a
a*b

a <- a*3
b <- b-5

#매트릭스와 데이터프레임의 자료구조 확인
class(iris) #자료구조 확인
class(state.x77)
is.matrix(iris) #매트릭스인지 확인
is.data.frame(iris) #데이터프레임인지 확인
is.matrix(state.x77)
is.data.frame(state.x77)

#매트릭스를 데이터프레임으로 변환
st <- data.frame(state.x77)
head(st)
class(st)

#데이터프레임을 매트릭스로 변환
iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)

#데이터프레임의 열 추출
iris[,"Species"]
iris[,5]
iris["Species"]
iris[5]
iris$Species

#파일 데이터 읽기
setwd("")
air <- read.csv("airquality.csv",header = T)
head(air)

#파일 데이터 쓰기 
setwd("")
my.iris <- subset(iris,Species='Setosa')
write.csv(my.iris, "my_iris.csv", row.names = F)
