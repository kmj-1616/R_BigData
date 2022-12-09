install.packages("wordcloud")
library(wordcloud)

word <- c("대한","민국","빅데이터","만세","코로나")
frequency <- c(651,85,61,100,45)
wordcloud(word,frequency,colors="blue")

#단어들의 색 변환
wordcloud(word,frequency,random.order=F, random.color=F,colors=rainbow(length(word)))

#다양한 단어 색 출력을 위한 팔레트 패키지의 활용
install.packages("RColorBrewer")
library(RColorBrewer)

pal2 <- brewer.pal(8,"Dark2")

word <- c("대한","민국","빅데이터","만세","코로나")
frequency <- c(651,85,61,100,45)

wordcloud(word,frequency,colors=pal2)

display.brewer.all()

##연설문의 단어에 대한 워드 클라우드 만들기 

install.packages("multilinguer")
library(multilinguer)
install_jdk()

install.packages(c("hash","tau","Sejong","RSQlite","devtools","bit","rex","lazyeval","htmlwidgets","crosstalk","promises","later","sessioninfo","xopen","bit64","blob","DBl","memoise","plogr","covr","DT","rcmdcheck","rversions"),type="binary")

install.packages("remotes")

remotes::install_github('haven-jeon/KoNLP',upgrade="never",INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
extractNoun("나는 동아대학교 학생입니다.")