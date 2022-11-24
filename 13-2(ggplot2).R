library(ggplot2)
library(dplyr)
#1. Titanic 데이터를 불러오고, 데이터 프레임으로 저장하시오
Titanic
tt <- as.data.frame(Titanic)

#2. 각 선실별 ’생존 인원‘에 대한 막대 그래프를 그리시오. 
a <- tt %>% filter(Survived=="Yes") %>% group_by(Class) %>% summarise(sum_Freq=sum(Freq))
a

ggplot(a, aes(x=Class, y=sum_Freq))+
  geom_bar(stat = "identity",
           width = 0.7)

#3. 선실별 ’생존율‘과 ’사망율‘ 데이터 만들기
b <- tt %>% group_by(Class, Survived) %>% summarise(sur_tot=sum(Freq)) %>% mutate(total=sum(sur_tot), perc=sur_tot/total*100)
b

#4. 선실별 생존율에 대한 막대 그래프 그리기
c <- b %>% filter(Survived=="Yes")
c

ggplot(c, aes(x=Class, y=perc , fill=Class))+
  geom_bar(stat = "identity")
