# Download the file in a temporay file and unzip it
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp)
unlink(temp)

# Load Library
library(dplyr)

# Read the data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merge the dataset
xrows<-rbind(x_test,x_train)
yrows<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)
dataset<-cbind(subject,xrows,yrows)

# Select the mean and std columns
meanstd_dataset<-select(dataset,subject,code,contains("mean"),contains("std"))

# Rename Activities Code by Activities Name
meanstd_dataset$code<-activities[meanstd_dataset$code,2]

# Rename Column Names
names(meanstd_dataset)<-sub("code","activities",names(meanstd_dataset))
names(meanstd_dataset)<-gsub("Acc", "Accelerometer", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("Gyro", "Gyroscope", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("BodyBody", "Body", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("Mag", "Magnitude", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("^t", "Time", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("^f", "Frequency", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("tBody", "TimeBody", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("-freq()", "Frequency", names(meanstd_dataset), ignore.case = TRUE)
names(meanstd_dataset)<-gsub("angle", "Angle", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("gravity", "Gravity", names(meanstd_dataset))

# Independent dataset by subject and activity
bygroup_dataset <- meanstd_dataset %>%
              group_by(subject,activities) %>%
              summarise_all(mean)
