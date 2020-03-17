a<- 5
a
a<-c(2,3,4)
a
a<-c(1:100)
a
a[-c(1:50)]

a<-paste0("V", (1:50))

a[c(40:60)]

b<-matrix(c(1:6), nrow=2, byrow=T)
b
b

m2<-data.frame(b)
colnames(m2)<-paste0("v", 1:3)
m2
cbind(m2,m2)
rbind(m2,m2)

install.packages("stringr")
library("stringr")
