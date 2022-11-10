###탐색적 데이터 분석
#mlbench 패키지 내 BostonHousing 데이터셋을 탐색
install.packages("mlbench")
library(mlbench)

#데이터셋의 특징 파악
data("BostonHousing")
help("BostonHousing")
dim(BostonHousing)

#crim, rim, dis, tax, medv 항목만 추출해서 별도의 파일 만들기
mj <- BostonHousing[,c("crim","rm","dis","tax","medv")]
mj

#grp는 주택가격을 상, 중, 하로 분류하기(ifelse 문으로 구현)
mj$grp <- ifelse(mj$medv >= 25.0, "상(H)",
                 ifelse(mj$medv <= 17.0, "하(L)", "중(M)"))
mj$grp

#주택가격 그룹별 빈도 구하기
table(mj$grp)

#각 변수들의 히스토그램 그리기
par(mfrow=c(2:3))
for (i in 1:5) {
  hist(mj[,i], main=colnames(mj)[i])
}

#각 변수들의 박스플롯을 그리고 이상치가 있는지 확인하기
for (i in 1:5) {
  boxplot(mj[,i], main=colnames(mj)[i])
}

#주택 가격과 범죄율의 상관관계 파악하기 
pairs(mj[,-6])
cor(mj$medv, mj$crim)
