# This R script gets and performs some cleaning on human activity data, built
# from recordings of subjects performing daily activities while carrying
# smartphone. The full description of the data set is available at:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Clean up workspace & load libraries

rm(list=ls())

library(dplyr)



### 1. Merges the training and the test sets to create one data set. 

setwd("C:/Users/Rayk/Documents/DataScience/03 Getting and Cleaning Data/03 Data/UCI HAR Dataset")

# Read in the data from files
features     = read.table('./features.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain       = read.table('./train/x_train.txt',header=FALSE)
yTrain       = read.table('./train/y_train.txt',header=FALSE)

subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest       = read.table('./test/x_test.txt',header=FALSE)
yTest       = read.table('./test/y_test.txt',header=FALSE)


# Assigin column names to the data imported above
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";

# Test der Daten
# head(xTest[1:8],10)

# Create full training and test set by merging the xTest, yTest and subjectTest data

trainingData = data.frame(yTrain,subjectTrain,xTrain)
testData = data.frame(yTest,subjectTest,xTest)

head(trainingData[1:8],10)


# Combine training and test data to create a final data set
CombinedData = rbind(trainingData,testData);



# Create a vector for the column names from the finalData, which will be used
# to select the desired mean() & stddev() columns

colNames  = colnames(CombinedData);


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.  



FinalData <- select(trainingData, contains("Id") , contains("mean"), contains("std"))

# FinalDatacolNames  = colnames(FinalData)
# head(FinalData[1:8],50)
# head(FinalData[1:8],3)

### 3. Uses descriptive activity names to name the activities in the data set 

FinalData = merge(activityType,FinalData ,by='activityId',all.y=TRUE)


### 4. Appropriately labels the data set with descriptive variable names.  

FinalData.colNames = colnames(FinalData);

for (i in 1:length(FinalData.colNames)) 
{
  FinalData.colNames[i] = gsub("\\()","",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("-std$","StdDev",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("-mean","Mean",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("^(t)","time",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("^(f)","freq",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("([Gg]ravity)","Gravity",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("[Gg]yro","Gyro",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("AccMag","AccMagnitude",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("JerkMag","JerkMagnitude",FinalData.colNames[i])
  FinalData.colNames[i] = gsub("GyroMag","GyroMagnitude",FinalData.colNames[i])
};

colnames(FinalData) = FinalData.colNames


### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyData <- FinalData %>%
  group_by(subjectId, activityType) %>%
  summarise_each(funs(mean))

# Export the tidyData set 
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')

