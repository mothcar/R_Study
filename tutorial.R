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
