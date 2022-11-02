###단일변수 범주형 자료의 탐색
#도수분포표의 작성
favorite <- c('winter','summer','spring','summer','summer','fall','fall',
              'summer','spring','spring')
favorite #favorite의 내용 출력
table(favorite) #도수분포표 계산 
table(favorite)/length(favorite) #비율 출력 

#막대그래프의 작성
ds <- table(favorite)
ds
barplot(ds, main = 'favorite season')
barplot(table(favorite)) #table 형태로 정리된 자료여야 한다

#원그래프의작성
pie(ds, main = 'favorite season', radius = 1.0) #radius: 그래프 크기 
pie(table(favorite)) #table 형태로 정리된 자료여야 한다 

#숫자로 표현된 범주형 자료
favorite.color <- c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)
ds <- table(favorite.color)
ds
barplot(ds, main = 'favorite color')
colors <- c('green','red','blue')
names(ds) <- colors #자료값 1,2,3을 green, red, blue로 변경 
ds
barplot(ds, main = 'favorite color',col = 'colors') #색 지정 막대그래프 
pie(ds, main = 'favorite color', col = 'colors') #색 지정 원그래프 


###단일변수 연속형 자료: 기술통계분석###
#평균과 중앙값
weight <- c(60,62,64,65,68,69)
weight.heavy <- c(weight, 120)
weight
weight.heavy

mean(weight) #평균
mean(weight.heavy)
 
median(weight) #중앙값
median(weight.heavy)

mean(weight, trim = 0.2) #절사평균(상하위 20% 제외)
mean(weight.heavy, trim = 0.2)

#사분위수
mydata <- c(60,62,64,65,68,69,120)
quantile(mydata)
quantile(mydata, (0:10)/10) #10% 단위로 구간을 나누어 계산 
summary(mydata)

#만약 100명이 시험을 봤다면, 위 결과를 어떻게 해석할 수 있을까?

#산포
var(mydata) #분산
sd(mydata) #표준편차
range(mydata) #값의 범위
diff(range(mydata)) #최대값, 최소값의 차이 

#히스토그램
dist <- cars[,2]  #자동차 제동거리(단위: 피트)
hist(dist,                                #자료
          main="Histogram for 제동거리",  #제목
          xlab = "제동거리",              #x축 레이블
          ylab = "빈도수",                #y축 레이블
          border = "blue",                #막대 테두리색
          col = "green",                  #막대 색
          las=2,                          #x축 글씨 방향(0~3)
          breaks = 5)                     #막대 개수 조절 

#박스플롯
dist <- cars[,2] #2번째 열만 가져옴
summary(dist)
boxplot(dist, main="자동차 제동거리")

boxplot.stats(dist) #정상범위 자료의 최소, 1Q, median, 3Q, c최대값을 차례로 보여줌 

#그룹이 있는 자료의 상자그림 
boxplot(Petal.Length~Species, data = iris, main="품종별 꽃잎의 길이")
