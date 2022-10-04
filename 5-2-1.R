### 행렬 생성
a <- matrix(1:4,nrow=2)
b <- matrix(1:9, nrow=3)
b
matrix(1:9)
c <- matrix(nrow=2, ncol = 3)
c #아무 값이 없음
c[1,2] <- 2
c #(1,2)에만 2 입력됨

d <- matrix(1:6,nrow = 2,byrow = T) #1~6을 요소로 가지는 2행(열은 자동) 행렬 할당
d

### 행렬 제목 생성
e <- c(1:4, 1,0,1,0,1,0,1,0)
e
matrix(e, nrow = 4, ncol = 3)
matrix(e,4,3,byrow = T)

f <- matrix(1:10,2,5)
colnames(f) <- c("col1","col2","col3","col4","col5")
f

rownames(f) <- paste("min",1:5)
f

f[1,2:4]

#행렬 간 연산
x <- matrix(1:4, 2)
y <- matrix(5:8, 2)
x+y
x-y
x*y #행렬 요소의 곱
x%*%y #행렬간 곱셈
solve(x) #행렬 x의 역행렬
t(x) #행렬 x의 전치행렬

##행렬 곱하기 문제
a <- matrix(c(3,3,2,5,1,7),2,3)
a
b <- matrix(c(0,4,5,0,2,1),3,byrow=T)
b
a%*%b

#벡터의 결합에 의한 행렬
a1 <- c(3,2,1)
a2 <- c(3,5,7)
a3 <- rbind(a1,a2)
a3

#R에 내장된 데이터를 활용한 실습
library(help="datasets")
quakes
head(quakes,n=10) #데이터의 앞부분 10개 행 보기(디폴트 n은 6)
tail(quakes,n=6) #데이터의 뒷부분 일부 보기(디폴트 n은 6)
names(quakes) #quakes 데이터 세트의 변수명 보기
str(quakes) #quakes 데이터 세트의 데이터 구조 보기 
dim(quakes) #quakes 데이터 세트의 차원 보기(행과 열의 수) 
summary(quakes) #quakes 데이터 세트의 각 변수별 데이터 요약 정보 
summary(quakes$mag) #quakes 데이터 세트 내의 mag 변수에 대한 최솟값, 25백분위수, 중앙값, 평균값, 75백분위수, 최댓값 
