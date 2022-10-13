df.sales <- data.frame(과일=c("사과","딸기","수박"),
                       가격=c(1800,1500,3000),
                       판매량=c(24,38,13))

mean(df.sales$가격) #가격 평균 
mean(df.sales$판매량) #판매량 평균 

mean(df.sales[,2]) #가격 평균
mean(df.sales[,"가격"])
