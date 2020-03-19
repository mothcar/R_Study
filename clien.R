getwd()
setwd('/Users/paulhwang/dev/2_r')
getwd(0)
getwd()
# https://www.clien.net/service/board/park?&od=T31&po=0 
url<-'https://www.clien.net/service/board/park?&od=T31&po=0'

b<-readLines(url, encoding = 'UTF-8')
length(b)
head(b, 10)
tail(b, 10)

# 클리앙 제목 뽑기 
b2<-b[str_detect(b, 'subject_fixed')]
title<-str_extract(b2, ("(?<=\">).*(?=</span>)")) 

b3<-b[str_detect(b, "<span class=\"hit\">")]
hit<-str_extract(b3, ("(?<=\">).*(?=</span>)"))
b3

# 강의 18분 이전으로 list 
