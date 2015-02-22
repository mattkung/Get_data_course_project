// set the working directory
setwd("~/Desktop/data science/get data/course project")

//set the url and download file
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="dataset.zip",method="curl")
unzip("dataset.zip")

//load dplyr
library(dplyr)

//read data from test and train
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
testsub<-read.table("./UCI HAR Dataset/test/subject_test.txt")
testact<-read.table("./UCI HAR Dataset/test/y_test.txt")
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainsub<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainact<-read.table("./UCI HAR Dataset/train/y_train.txt")
feature<-read.table("./UCI HAR Dataset/features.txt")
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")


//1. Merges the training and the test sets to create one data set.
//combine test subject and activity
test<-cbind(testsub,testact,test)
//combine train subject and activity
train<-cbind(trainsub,trainact,train)
//combine test and train
data<-rbind(test,train)





//3.Uses descriptive activity names to name the activities in the data set
colnames(data)[1]<-"subject"
colnames(data)[2]<-"activity"
data<-merge(activity,data,by.x="V1",by.y="activity",all=TRUE)
//remove duplicated column from merge
data<-data[,-1]
//change order, since from merge, the order of suject and activity reserve 
//http://stackoverflow.com/questions/5620885/how-does-one-reorder-columns-in-r
data<-data %>% select (subject,V2.x,everything())

//4. Appropriately labels the data set with descriptive variable names. 
fullcol<-c(c("subject","activity"),as.character(feature$V2))
colnames(data)<-fullcol

//2. Extracts only the measurements on the mean and standard deviation for each measurement
//extract only mean and std
data<-data[,c(c(1,2),grep(pattern = "mean|std",fullcol))]

//5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
//remove duplicate column
data <- data[, !duplicated(colnames(data))]
//pass data into, and group by subject and activity. summarise each and do the asked function by column.
result<-data%>%group_by(subject,activity) %>% summarise_each(funs(mean))

//creat a tidy data set
write.table(result,file="tidy_data_set.txt",row.names=FALSE)


