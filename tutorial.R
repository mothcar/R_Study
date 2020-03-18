# Start 
a<-1
a
a=1
a

b<-a+1
b
# vertor 
a<-c(1,2,3,4,5,6)
a
a[2]
a[-1]
a[c(2,5)]

b<-c("가", '나')
b
d<-c('1','2','3')
# d<-c("1","2","3")
d
class(d) # [1] "character"
class(a) # [1] "numeric"

d<-as.numeric(d)
class(d)

# : ## ~부터 ~까지 
e<-1:100
e
e[c(1, 9)]
e[1:10]
e[-1:10] # Error in e[-1:10] : only 0's may be mixed with negative subscripts
e[-c(1:50)]

#paste0 
paste0('v', 1:10)


# data frame 
a<-c(1,2,3)
a[2:3]
a[c(T,F,T)]

# matrix 
m<-matrix(c(1,2,3,4,5,6))
m
class(m)
m<-matrix(c(1,2,3,4,5,6), nrow=2, byrow=T)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
m
m<-matrix(c(1,2,3,4,5,6), nrow=2, byrow=F)
m
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
m2<-data.frame(m)
m2
#    X1 X2 X3
# 1  1  3  5
# 2  2  4  6
m2[1,2]
m2[2,]
m2[,1]
m2[-2,]
m2[-1,-1]
m2[-1, -c(1,2)]
m2[c(T,T),]
m2[c(T,T),c(F,T,T)]
m2
m2$X1
colnames(m2)<-paste0('v', 1:3) # new column name 
m2$v2

# cbind / rbind 
m2
cbind(m2, m2)
cbind(m2, m2, m2)
rbind(m2,m2)
m3<-rbind(m2,m2,m2,m2)
m3[m3$v1==1,]
m3
m3[m3[,2]==3,]  # difficult to understand ************************  
m3$v4<-1:8
m3
nrow(m3) # number of row ## like length  8
length(m3) # [1] 4 

# datafram3 13min   
nrow(m3)
m3$v5<-2:(nrow(m3)+1)  # (계산식)
ncol(m3)
m3$v6<-ifelse(m3$v1 %% 2 == 0, '짝수', '홀수')
m3
str(m3)
head(m3)
tail(m3, 7)

# dataframe 저장하고 불러오기 
# 1번째부터 10번째까지 수집하기 
m4<- NULL
for(i in 1:10) {
 m4<-rbind(m4, m2) 
 cat('\n', i)

}
m4
dim(m4)

# String package 
install.packages("stringr")
library(stringr)
fruit <- c("apple", "banana", "pear", "pineapple")
str_count(fruit, "a")
str_count(fruit, "p")
str_count(fruit, "e")
str_count(fruit, c("a", "b", "p", "p"))

m3
str_detect(m3$v6, '홀') # [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE
m3[str_detect(m3$v6, '홀'), ]
m3[1,6]<-'홀123'
m3
m3[m3$v6 %in% '홀수', ]

# /Users/paulhwang/dev/2_r
setwd('/Users/paulhwang/dev/2_r')
getwd()

# 저장 
write.csv(m3, 'm3.csv', row.names = F)
m4<-read.csv('m3.csv')
m4<-read.csv('m3.csv')[-1, ] # row.names가 추가 되었을때 빼고 보고 싶을때
m4

# R기초 반복문활용
# 3개의 폴더의 파일들을 하나의 파일로 만들기 
setwd('/Users/paulhwang/dev/2_r')
# 현재 디렉토리내의 파일 가져오기 
list.files()
file_list<-list.files()
file_list[-c(2,5, 6,7)]
library(stringr)
str_detect(file_list, 'R')
str_detect(file_list, 'csv')
file_list

folder_index<-str_detect(file_list, 'R') | str_detect(file_list, 'csv')
folder_list<-file_list[!folder_index]

final_data<-NULL
#i<-2
for(i in 1:length(folder_list)) {
  setwd(paste0('/Users/paulhwang/dev/2_r/',folder_list[i]))
  getwd()
  file_list<-list.files()
  # j<-4
  for(j in 1:length(file_list)) {
    data<-read.csv(file_list[j])
    final_data<-rbind(final_data, data)
    cat('\n', i, '-', j)
  } # inner for 
} # outter for 

head(final_data)
tail(final_data)
dim(final_data)

# 컬럼수가 다를때 같은 종류끼리 data를 합칠때 
setwd('/Users/paulhwang/dev/2_r')
data<-read.csv('m3.csv')
data
data$v7<-1:nrow(data)
data
write.csv(data, 'data.csv', row.names = F)
list.files()

getwd()
file_list<-list.files()
file_list[-c(2,5, 6,7)]
library(stringr)
str_detect(file_list, 'R')
str_detect(file_list, 'csv')
file_list

folder_index<-str_detect(file_list, 'R') | str_detect(file_list, 'csv')
folder_list<-file_list[!folder_index]

final_data<-NULL
final_data2<-NULL
i<-2
for(i in 1:length(folder_list)) {
  setwd(paste0('/Users/paulhwang/dev/2_r/',folder_list[i]))
  getwd()
  file_list<-list.files()
  # j<-4
  for(j in 1:length(file_list)) {
    data<-read.csv(file_list[j])
    if(ncol(data)==6) {
      final_data<-rbind(final_data, data)
    } else {
      final_data2<-rbind(final_data2, data)
    }
    
    cat('\n', i, '-', j)
  } # inner for 
} # outter for

dim(final_data)
dim(final_data2)
