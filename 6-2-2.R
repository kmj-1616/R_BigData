##csv 파일 열기 
a <- read.csv('ex_comma.csv',header = T, sep = ',',encoding = 'latin1',na.strings = "-")
#쉼표로 분리
b <- read.csv('ex_tab.csv',header = T,sep = '\t')
#탭으로 분리

#한글 변수명 불러오기
c <- read.csv('ex_comma.csv',header = T, sep = ',',encoding = 'euc-kr',na.strings = "-")
d <- read.csv(file.choose(), header = T, sep = ',',encoding='euc-kr',na.strings = "-")
#파일명 대신 file.choose()를 입력하면 파일 열기 창을 이용할 수 있음


##엑셀 파일 열기
install.packages("xlsx")
library(xlsx)
d <- read.xlsx('ex_xlsx.xlsx',sheetIndex=1, encoding='UTF-8')
e <- read.xlsx(file.choose(),sheetIndex=1,encoding='UTF-8')
#read.xlsx(파일명,sheetIndex=시트 번호,encoding='UTF-8')
e <- read.xlsx(file.choose(),sheetName='Sheet1',encoding='UTF-8')

install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$science)

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet


##파일 내보내기
write.csv(a, 'test.csv', row.names = T)
write.table(a, 'test1.csv', row.names = T, sep=',')

