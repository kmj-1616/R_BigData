##데이터 프레임
#데이터 프레임 생성
name <- c("KIM","LEE","HAN","SHIN","PARK")
gender <- as.factor(c("M","F","M","M","F"))
math <- c(100,80,75,95,65)
english <- c(80,100,60,70,80)
korean <- c(50,70,80,100,100)
attend <- c(T,F,T,T,F)
a <- data.frame(name,gender,math,english,korean,attend,stringsAsFactors = T)
#만들어 둔 벡터를 데이터 프레임으로 결합(stringsAsFactors: 문자형 중 규칙적인 패턴을 찾아 범주형으로 인식하는옵션)
a <- data.frame(name,gender,math,english,korean,attend)

#데이터 병합(두 개의 행 추가)
name <- c("JANG","JEONG")
gender <- as.factor(c("M","F"))
math <- c(100,80)
english <- c(80,100)
korean <- c(50,70)
attend <- c(T,F)
b <- data.frame(name,gender,math,english,korean,attend)
c <- rbind(a,b) #rbind(기존 데이터프레임, 추가할 데이터 프레임): 행 추가
c

#데이터 열 합치기(cbind)
social <- c(100,80,50,65,70)
science <- c(80,55,75,60,100)
d <- cbind(a,social,science) #cbind(기존 데이터 프레임, 추가할데이터 프레임 or 벡터)
d

#데이터 열 합치기(transform 함수)
e <- transform(a, social=c(100,80,50,65,70), science=c(80,55,75,60,100))
e
#transform(기존 데이터 프레임, 추가할 열 이름=데이터)

#데이터 열 합치기(merge 함수)
name <- c("LEE","KIM","HAN","SHIN","PARK")
japanese <- c(100,60,70,20,50)
f <- data.frame(name,japanese)
f
g <- merge(a,f,key="name")
#merge(기존 데이터 프레임, 추가할 데이터 프레임, key="기준으로 할 열 제목")

#데이터 추출

#데이터 인덱싱(범위 설정)
a$name #데이터 프레임 a에서 name 행만 추출 
a[,1:2] #a에서 1~2번째 열만 추출
a[2:3,] #a에서 2~3번째 행만 추출 
a[2:3, 1:2] #a에서 2~3번째 행, 1~2번째 열만 추출 
a[-1,] #a에서 1번째 행을 제외한 모든 행 추출 

#데이터 인덱싱(조건)
a[a$math>=70,] #a에서 math가 70 이상인 행만 추출 
a[a$name=="KIM",] #a에서 name이 KIM인 행만 추출 
a[a$english<90,] #a에서 english가 90 미만인 행만 추출
a[a$math>=70&a$korean>=70,] #a에서 math가 70 이상이고 korean이 70 이상인 행만 추출(&:and) 
a[a$math<90|a$korean<90] #a에서 math가 90 미만이거나 korean이 90 미만인 행만 추출(|:or) 


#데이터 인덱싱(subset 함수)
h <- subset(a,select=c(name,math,korean),subset=(math>=50&korean>=70))
h
#a에서 math가 50 이상, korean이 70 이상인 데이터 중에서 name, math, korean 열만 추출
#subset(데이터 프레임, select=c(열 제목 or 번호), subset=(조건))

#정렬
#열 위치 바꾸기
a <- a[,c(1,2,6,5,3,4)] #열 위치를 다음과 같이 바꾸기(1,2,6,5,3,4) 
a
#행 정렬(order 함수)
i <- a[order(a$math, -a$english, a$korean),]
i
#데이터프레임[order(정렬 1순위, 정렬 2순위, 정렬 3순위,...)] (cf.정렬할 열 앞에 -를 붙일 경우 내림차순 정렬) 
