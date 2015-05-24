analysis_data <- function(outcome1,outcome2,outcome3,outcome4,outcome5,outcome6,outcome7,outcome8,nc) {

## Package installation
install.packages("dplyr")
library(dplyr)
install.packages("fBasics")
library(fBasics)

## Point 1 - Merge

train<-read.table(outcome1) 
test<-read.table(outcome2)

tmerge<-merge(test,train,all=TRUE)

## Point 2 - mean and standard deviation

medias<-colMeans(tmerge)
desvia<-colStdevs(tmerge)

## Point 3
trainlab<-read.table(outcome3) 
testlab<-read.table(outcome4) 
activity<-read.table(outcome5)

tmergelab<-rbind(testlab,trainlab)
tmergelab2<-rename(tmergelab,act=V1)
activity2<-rename(activity,act=V1,name_act=V2)
tmerg2<-cbind(tmergelab2,tmerge)
tmerg3<-merge(activity2,tmerg2,by="act",all.x=FALSE)

## Point 4
features<-read.table(outcome6)
vfeatures<-vector("character",length=nc)
vfeatures[1]<-"act"
vfeatures[2]<-"name_act"

vfeatures[3:nc]<-as.character(features[,2])

colnames(tmerg3)<-vfeatures
tmerg4<-tmerg3

## Point 5
trainsub<-read.table(outcome7) 
testsub<-read.table(outcome8)
tmergesub<-merge(testsub,trainsub,all=TRUE)
tmergesub2<-rename(tmergesub,sub=V1)

tmerg5<-cbind(tmergelab2,tmergesub2,tmerg4)

tmerg7<-aggregate(tmerg5, by=list(tmerg5$sub,tmerg5$act), FUN=mean)
tmerg8<-tmerg7[-c(5,6)]
tmerg9<-merge(activity2,tmerg8,by="act",all.x=FALSE)

write.table(tmerg9,file="./clean_data.txt",row.names=FALSE)

tmerg9

}
