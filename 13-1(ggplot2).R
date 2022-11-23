##막대그래프의 작성
library(ggplot2)
month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain) #그래프를 작성할 대상 데이터
df

ggplot(df,aes(x=month,y=rain))+ #그래프를 그릴 데이터 지정
  geom_bar(stat = "identity", #막대의 높이는 y축에 해당하는 열의 값
           width=0.7, #막대의 폭 지정
           fill="steelblue") #막대의 색 지정

##막대그래프 꾸미기
ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat = "identity",
           width=0.7,
           fill="steelblue")+
           ggtitle("월별 강수량")+ #그래프의 제목 지정
           theme(plot.title = element_text(size = 25, face = "bold",colour = "steelblue"))+
           labs(x="월",y="강수량")+ #그래프의 x,y축 레이블 지정
           coord_flip() #그래프를 가로 방향으로 출력

##히스토그램
ggplot(iris, aes(x=Petal.Length))+ #그래프를 그릴 데이터 지정
  geom_histogram(binwidth = 0.5) #데이터구간을 0.5 간격으로 나눠 히스토그램 작성

#그룹별 히스토그램 작성하기
ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species))+ #막대 내부, 윤곽선 색 지정
  geom_histogram(binwidth = 0.5, position="dodge")+ #dodge=막대들을 겹치지 않고 병렬로 그리도록 지정
  theme(legend.position = "top")

##산점도
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))+
  geom_point( )

#그룹이 구분되는 산점도
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color=Species))+
  geom_point(size=3)+
  ggtitle("꽃잎의 길이와 폭")+ #그래프의 제목 지정
  theme(plot.title = element_text(size=25,face="bold",colour="steelblue"))

##Boxplot
ggplot(data = iris, aes(y=Petal.Length))+
  geom_boxplot(fill="yellow")

#그룹별 상자그림 작성하기
ggplot(data = iris, aes(y=Petal.Length, fill=Species))+
  geom_boxplot( )

##선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt) #데이터 준비
head(df)

ggplot(data = df, aes(x=year,y=cnt))+ #선그래프 작성
  geom_line(col="red")
