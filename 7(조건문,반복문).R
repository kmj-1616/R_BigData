#데이터세트 다루기
head(quakes,n=10) #데이터 앞부분 10개 행
tail(quakes, n=6) #데이터 뒷부분 6개
names(quakes) #변수명 보기
str(quakes) #데이터 구조 보기
dim(quakes) #차원 보기(행과 열의 수)
summary(quakes) #각 변수별 데이터 요약 정보
summary(quakes$mag) #mag변수에 대한 요약 정보


#ggplot2의 mpg데이터를 데이터프레임 형태로 불러오기
install.packages("dplyr")
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)

##웹의 데이터 파일(Titanic) 읽기
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
x <- read.csv(url)
x

##변수명 바꾸기
df_raw <- data.frame(var1=c(1,2,1),var2=c(2,3,2))
df_new <- df_raw #복사본 생성  
df_new <- rename(df_new, v2=var2) #var2를 v2로 수정  

names(df_new)[c(2)] <- c("V2") #names 사용하는 방법  
df_new #v2를 V2로 수정 

##변수 조합해 파생변수 만들기
df <- data.frame(var1=c(4,3,8),var2=c(2,6,1)) #데이터프레임 생성
df
df$var_sum <- df$var1+df$var2 #var_sum 파생변수 생성  
df
df$var_mean <- (df$var_sum)/2 #var_mean 파생변수 생성  
df

###혼자서 해보기
#1.ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본 만들기
mpg <- as.data.frame(ggplot2::mpg) #mpg 데이터 불러오기
mpg_new <- mpg #복사본 만들기

#2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수병을 수정하세요.
mpg_new <- rename(mpg_new, city=cty) #cty를 city로 수정
mpg_new <- rename(mpg_new, highway=hwy) #hwy를 highway로 수정

#3. 데이터 일부를 출력해서 변수명 바뀌었는지 확인
head(mpg_new)



########조건문
#4-1
job.type <- 'A'

if(job.type=='B'){
   bonus <- 200 #직무 유형이 B일 때 실행
} else{
   bonus <- 100 #직무 유형이 B가 아닌 나머지 경우 실행
}

print(bonus) #100

#4-2 else 생략
job.type <- 'B'
bonus <- 100

if(job.type=='A'){
  bonus <- 200 #직무 유형이 B일 때 실행
}

print(bonus) #100

#4-3 다중 ifelse문
score <- 85

if(score>90){
  grade <- 'A'
} else if(score <- 80){
  grade <- 'B'
} else if(score <- 70){
  grade <- 'C'
} else if(score <- 60){
  grade <- 'D'
} else{
  grade <- 'F'
}

print(grade) #"B"

#코드블록: 중괄호{} 여러 명령문을 하나로 묶어 줌
a <- 10
if(a<5){
  print(a)
} else{       #else는 if문의 코드블록이 끝나는 부분에 있는 }와 같은 줄에 써야 함
  print(a*10) #100
  print(a/10) #1
}

#조건문: 논리 연산자의 사용
score <- 90
attend <- 20
grade <- '분발필요'
if(score>90 & attend>=50){
  grade <- 'A'
}
grade #분발필요 

a <- 10
b <- 20
if(a>5 & b>5){ #and 사용
  print(a+b) #30
}
if(a>5 | b>30){ #or 사용
  print(a*b) #200
}

#조건문: ifelse문
a <- 10
b <- 20

if(a>b){
  c <- a
}else{
  c <- b
}

print(c) #20

d <- ifelse(a>b, a, b) #한 줄로 작성할 수 있다
print(d) #20

e <- ifelse(a>=10, '우수',
            ifelse(a>=5,'보통','미달'))
print(e)


########반복문: for문
for(반복변수 in 범위){
  명령문
}

for(i in 1:5){
  print('*')
}

#반복 범위에 다른 반복 변수의 값 변화
for(i in 6:10){
  print(i)
}

#반복 변수를 이용한 구구단 출력
for(i in 1:9){
  cat('2*',i,'=',2*i,'\n')
}

#for문 안에서 if문의 사용
for(i in 1:20){
  if(i%%2==0){  #짝수인지 확인
    print(i) #짝수이면 출력
  }
}

#1~100 사이의 숫자의 합 출력
sum <- 0
for(i in 1:100){
  sum <- sum+i  #sun에 i 값을 누적
}
print(sum)

####Iris 데이터에서 꽃잎의 길이에 따른 분류 작업
norow <- nrow(iris) #iris의 행의 수
mylabel <- c() #비어 있는 벡터 선언
for(i in 1:norow){
  if (iris$Petal.Length[i] >=1.6){  #꽃잎의 길이에 따라 레이블 결정
      mylabel[i] <- 'LARGE'
  } else if(iris$Petal.Length[i] >=5.1){
      mylabel[i] <- 'High'
  } else{
      mylabel[i] <- 'Middle'
  }
}
print(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel) #꽃잎의 길이와 레이블 결합
head(mylabel)


##while문으로 1~100 합
sum <- 0
i <- 1
while(i<=100){
  sum <- sum+i #sum에 i 값을 누적
  i <- i+1 #i 값을 1 증가시킴
}
sum #5050

#break
sum <- 0
for(i in 1:10){
  sum <- sum+i
  if(i>=5) break #5 초과면 멈춤
}
sum

#next
sum <- 0
for(i in 1:10){
  if(i%%2==0) next #짝수면 건너뛰기
  sum <- sum+i
}
sum

######apply() 함수: 반복 작업의 대상이 매트릭스나 데이터프레임의 행 또는 열일 때
apply(iris[,1:4],1,mean) #행 방향으로 함수 적용 
apply(iris[,1:4],2,mean) #열 방향으로 함수 적용 

#혼자서 해보기
#mpg에서 고속도로와 일반도로 연비를 종합해서 total이라는 통합 연비를 나타내는 변수만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg$total <- (mpg$cty + mpg$hwy)/2 #통합 연비 변수 생성 
head(mpg)
mean(mpg$total) #각 모델의 통합연비 평균
#통합연비 20을 기준으로 합격불합격 판단을 내리는 변수 추가하기
mpg$test <- ifelse(mpg$total >=20, "합격", "불합격")
head(mpg,20)

table(mpg$test) #연비 합격 빈도표 생성 

library(ggplot2)
qplot(mpg$test) #연비 합격 빈도 막대 그래프 생성
