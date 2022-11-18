#Q1. mpg 데이터의 class는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로 분류한 변수이다. class별 cty 평균을 구해 보시오.

library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty))

#Q2. cty 평균이 높은 순으로 정렬해 보세요.

mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty)) %>% arrange(desc(mean_cty))

#Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려 합니다. hwy 평균이 가장 높은 회사 세 곳을 출력하시오.

mpg %>% group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy)) %>% head(3)

#Q4. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 확인하고 싶다. 회사별 "compact" 차종 수를 내림차순으로 정렬하시오.

mpg %>% group_by(manufacturer) %>% filter(class=="compact") %>% summarise(n=n()) %>% arrange(desc(n))

#Q5. R에서 기본적으로 주어지는 데이터 airquality의 변수 풍속(Wind)에서 이상치를 확인하고, 제거한 후 풍속(Wind)의 평균을 구하세요.

airquality
boxplot(airquality$Wind)$stats
outlier <- ifelse(airquality$Wind >= 16.6, NA, airquality$Wind)
outlier
nomiss <- airquality %>% filter(!is.na(outlier))
mean(nomiss$Wind)
