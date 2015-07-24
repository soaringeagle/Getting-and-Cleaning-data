
#download,unzip file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "runanalysis.zip", method="libcurl")
unzip("runanalysis.zip")

## Step 1. Merges the training and the test sets to create one data set.

#read supporting data
featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI Har Dataset/activity_labels.txt", header = FALSE)


# read test and train data
testactivity <- read.table("UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testfeature <- read.table("UCI HAR Dataset/test/X_test.txt")
trainactivity <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainfeature <- read.table("UCI HAR Dataset/train/X_train.txt")

# put it together in the format of: subjects, activity, features
activity <- rbind(testactivity, trainactivity)
subject <- rbind(testsubject,trainsubject)
feature <- rbind(testfeature,trainfeature)

#name the columns
colnames(activity)<- "Activity"
colnames(subject) <- "Subject"
colnames(feature)<- t(featureNames[2])

#Merge the columns to a dataset
data<- cbind(subject, activity, feature)

## step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

#Extract the columns names with mean or std in them
columnsMeanSTD <- grep(".*Mean.*|.*Std.*", names(data), ignore.case=TRUE)

#Creat a new dataset with subject, activity and columns with mean and std in their names.
extractedcols <- data[,c(1,2,columnsMeanSTD)]
dim(extractedcols)

## step 3. Uses descriptive activity names to name the activities in the data set

# read the labels (activities)
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
# replace activity labels in data with activity names
extractedcols$Activity <- activityLabels[extractedcols$Activity, 2]
extractedcols$Activity <- as.factor(extractedcols$Activity)

## step 4 Appropriately labels the data set with descriptive variable names. 

# first make a list of the current column names
names(extractedcols)
 # The following changes can be made to get descriptive variable names:
#Acc <- Accelerometer
#Gyro<- Gyroscope
#BodyBody <-Body
#Mag <- Magnitude, etc.

names(extractedcols) <- gsub("Acc", "Accelerometer", names(extractedcols))
names(extractedcols) <- gsub("Gyro", "Gyroscoper", names(extractedcols))
names(extractedcols) <- gsub("BodyBody", "Body", names(extractedcols))
names(extractedcols) <- gsub("Mag", "Magnitude", names(extractedcols))
names(extractedcols) <- gsub("angle", "Angle", names(extractedcols))
names(extractedcols) <- gsub("gravity", "Gravity", names(extractedcols))
names(extractedcols) <- gsub("-mean", "Mean", names(extractedcols))
names(extractedcols) <- gsub("-std", "STD", names(extractedcols))
names(extractedcols)

## step 5 From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

# Get the mean for each combination of subject and label, and create a new tidy dataset.

library(data.table)
library(dplyr)
extractedcols <- data.table(extractedcols)
tidyData <- aggregate(.~ Subject +Activity, extractedcols,mean)
tidyData <- tidyData[order(tidyData$Subject),]

# write the data for course upload
write.table(tidyData, file="tidyDataset.txt", row.names=FALSE)