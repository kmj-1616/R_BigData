##week 4##
8%%3
2^3
2^10
(2+6)*8

log(10)+10
sqrt(25) #제곱근

x<-c(-10,20,30,40,50)
mean(x)
max(x)
max(5,3,2)
min(x)

abs(-10) #절대값
abs(x)

###변수의 정의###

a<-10 #권장
a=12 # 같다는 의미는 ==
a<<-13

# <- #Alt + -

b <-20
a+b
c<-a+b
c
C <- 15 #대소문자 구분

a.avg <- mean(x)
a.avg

a.abs <- abs(-15)
a.abs


x <- 1 #단일값 할당
print(x)
x

msg<-"hello" #문자열을 변수에 할당
msg

x <- 11:30 #11부터 30까지 정수값을 x에 할당
x

###변수의 변경###
a <- 10
b <- 20
a<-'A'
a+b

rm(a)
ls()
rm(list=ls()) #모든 변수 삭제

###데이터의 종류###
a <- c(1,2,3,4,5)
b <- c('a','b','c','d','e')
c <- factor(c('male','female','male','female'))
d <- c(T,F,T,FALSE)
e <- c(3i)

is.numeric(b)

a <- as.character(a)

####벡터##
a <- c(1,5,10)
b <- c('a','b','c')
c <- c('1','2','3')
d <- c(T,F,T)

height <- c(160,145,180)
name <- c('ryu','kim','lee')
names(height) <- name
height

height[1]
height['ryu']

##주변 친구 10명의 취미와 이름을 각각 벡터로 저아하고, 각 요소에 이름 할당하기
hobby <- c('게임','운동','영화','노래','춤','게임','운동','요리','여행','게임')
name <- c('김ㅇㅇ','강ㅇㅇ','박ㅇㅇ','최ㅇㅇ','권ㅇㅇ','김ㅁㅁ','임ㅇㅇ','이ㅇㅇ','장ㅇㅇ','이ㅁㅁ')
names(hobby) <- name
hobby


##1에서 7을 4등분한 값을 d에 할당##
d <- seq(1,7,length=4)
d
