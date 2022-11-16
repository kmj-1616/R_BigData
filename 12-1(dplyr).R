###빅데이터분석 01분반 2016677 권미정

##조건에 맞는 데이터만 추출하기
library(dplyr)
exam <- read.csv("csv_exam.csv")

#exam에서 class가 1인 경우만 추출하여 출력
exam %>% filter(class==1)


##여러 조건을 충족하는 행 추출하기

#1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class==1 & math >= 50)

#수학 점수가 80점 이상이고 영어점수가 90점 이상인 경우
exam %>% filter(math >= 80 & english >=90)

#수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >=90)

#2반이면서 영어점수가 80점 이상인 경우
exam %>% filter(class==2 & english >=80)


##추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class==1)
class2 <- exam %>% filter(class==2)

mean(class1$math) #1반 수학 점수 평균 구하기
mean(class1$english) #1반 영어점수 평균 구하기
mean(class2$english) #2반 영어점수 평균 구하기 


##필요한 행 추출하기
exam %>% select(class,math,english)
exam %>% select(-math) #수학 제외 나머지 행


##Filter() & select()

#class가 1인 행만 추출한 다음, english 추출
exam %>% filter(class==1) %>% select(english)


##집단별로 나누고 평균 구하기

#요약하기
exam %>% summarise(mean_math = mean(math)) #math 평균 산출 

#집단별로 요약하기
exam %>% 
  group_by(class) %>% #class별로 분리
  summarise(mean_math=mean(math)) #math 평균

#여러 요약통계량 한 번에 산출하기
exam %>% 
  group_by(class) %>% #class별로 분리
  summarise(mean_math=mean(math), #math 평균
            sum_math=sum(math), #math 합계
            median_math=median(math), #math 중앙값
            n=n(), #학생 수
            max_math=max(math)) #math 최대값 


##각 집단별로 다시 집단 나누기(mpg data 실습)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)

#mpg 데이터에서 먼저 회사별로 구분하고, 다시 각 회사 내에서 구동 방식별로 구분
mpg %>% 
  group_by(manufacturer, drv) %>% #회사별, 구동방식별 분리
  summarise(mean_cty=mean(cty)) %>% #cty 평균 산출
  head(10) #10행까지 출력 


##결측치

df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

is.na(df) #결측치 확인
table(is.na(df)) #결측치 빈도 출력
table(is.na(df$sex))
table(is.na(df$score))
table(!is.na(df))

#score가 NA인 데이터만 출력
df %>% filter(is.na(score))

#score 결측치 제거
df %>% filter(!is.na(score))

#결측치를 제거한 데이터만 추출
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
mean(df_nomiss$score)

## 함수의 결측치 제외 기능 이용하기(na.rm=T)

na.omit(df) #모든 변수에 결측치 없는 데이터 추출 
mean(df$score, na.rm=T) #결측치 제외하고 평균 산출 
sum(df$score, na.rm=T) #결측치 제외하고 합계 산출 

#summarise()에서 na.rm=T 사용하기

exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA #3,8,15행의 math에 NA 할당

exam %>% summarise(mean_math=mean(math)) #평균 산출

#결측치 제외하고 평균 구하기
exam %>% summarise(mean_math=mean(math, na.rm=T))
