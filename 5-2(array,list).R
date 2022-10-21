#배열 생성
a <- array(1:24,c(3,3,2)) #변수 a에 1~24를 요소로 가지는 3행 3열 2차원 배열 할당 
b <- array(1:6) #변수 b에 1행 6열 할당
c <- array(1:6, c(2,3)) #변수 c에 2행 3열 할당 
d <- array(1:8, c(2,2,2)) #변수 d에 2행 2열 2차원 배열 할당 
e <- c(1:24); dim(e) <- c(3,4,2) #변수 e에 저장된 1~24 요소를 가지고 3행 4열 2차원 배열을 만들어 다시 변수 e에 할당 
e

#배열 제목 생성
f <- array(1:24, c(3,3,2)) #행,열,배열을 넘어가는 범위의 요소는 버려짐 
dimnames(f) <- list(c("가","나","다"), c("A","B","C"), c("ARR1","ARR2")) #배열에 제목 부여 
f
dimnames(f) <- list(paste("ROW",c(1:3)), paste("COL",c(1:3)), paste("ARR",c(1:2))) #paste 함수 응용하여 배열에 제목 부여 
f

#배열 관련 함수
g <- array(1:24, c(3,4,2))
dimnames(g) <- list(c("1","2","3"), c("A","B","C","D"), c("ARR1","ARR2"))
g
length(g) #요소의 개수 확인 
mode(g) #데이터 타입의 형태 확인 
dim(g) #각 차원의 벡터 크기 
dimnames(g) #행, 열, 차원 제목 리스트 

#리스트 생성
y <- list("name"="mijeong","ID"="2016677",courses=c("bigdata","stats","math"))
y
a <- list("top", c(2,4,6), c(T,F,T))
a
b <- list(name=c("Minsu","Minho"), cnt=2, age=c(2,6))
b
c <- list(c("Abe","Bob","Caro","Deb"), c("Weight","Height"))
c
names(C) <- c("Rows","Columns")
c
names(b) #제목 리스트 출력
length(b) #리스트 개수 출력
b$name #리스트 b 내부에 있는 name 자료 출력 
b$cnt
b$age
c$Columns

#리스트 연습
ds <- c(90,85,70,84)
my.info <- list(name='Tom', age=60, status=TRUE, score=ds)
my.info
my.info[[1]] #리스트의 첫 번째 값을 출력 
my.info$name #리스트에서 값의 이름이 name인 값을 출력 
my.info[[4]]
