#Getting and Cleaning Data Project

##Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

Source Data Set Information
A full description of the data used in this project can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html)

The source data for this project can be found here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Attribute Information
For each record in the dataset it is provided: 
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
Triaxial Angular velocity from the gyroscope. 
A 561-feature vector with time and frequency domain variables. 
Its activity label. 
An identifier of the subject who carried out the experiment. 


##Data processing steps
The source data must be provided in the working directory setwd("C:/Users/[User]/Documents/DataScience/03 Getting and Cleaning Data/03 Data/UCI HAR Dataset")

The R script called run_analysis.R performs following steps to produce a tidy data set : 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
features.txt 
activity_labels.txt 
subject_train.txt 
x_train.txt 
y_train.txt 
subject_test.txt 
x_test.txt 
y_test.txt 
Assign column names and merge to create one data set.

###2. Extract only the measurements on the mean and standard deviation for each measurement.
Filter all data columns where columns names contains: contains("Id") , contains("mean"), contains("std").

###3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to inlude the descriptive activity names
To satisfy the requirements above, the following replacements were performed:
1. Replace -mean with Mean 
2. Replace -std with Std 
3. Remove characters -() 
4. Replace BodyBody with Body 

###4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

###5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
As per the project instructions, we need to produce only a data set with the average of each variable for each activity and subject


##Output data file
The file tidyData.txt is tab-separated.

###ID Fields
subjectId - The participant ("subject") ID 
activityType - The label of the activity performed when the corresponding measurements were taken 

###Activity Labels
WALKING (value 1) 
WALKING_UPSTAIRS (value 2) 
WALKING_DOWNSTAIRS (value 3) 
SITTING (value 4) 
STANDING (value 5) 
LAYING (value 6) 

###Columns of tidy data set

subjectId
activityType
activityId
timeBodyAcc.mean...X
timeBodyAcc.mean...Y
timeBodyAcc.mean...Z
timeGravityAcc.mean...X
timeGravityAcc.mean...Y
timeGravityAcc.mean...Z
timeBodyAccJerk.mean...X
timeBodyAccJerk.mean...Y
timeBodyAccJerk.mean...Z
timeBodyGyro.mean...X
timeBodyGyro.mean...Y
timeBodyGyro.mean...Z
timeBodyGyroJerk.mean...X
timeBodyGyroJerk.mean...Y
timeBodyGyroJerk.mean...Z
timeBodyAccMagnitude.mean..
timeGravityAccMagnitude.mean..
timeBodyAccJerkMagnitude.mean..
timeBodyGyroMagnitude.mean..
timeBodyGyroJerkMagnitude.mean..
freqBodyAcc.mean...X
freqBodyAcc.mean...Y
freqBodyAcc.mean...Z
freqBodyAcc.meanFreq...X
freqBodyAcc.meanFreq...Y
freqBodyAcc.meanFreq...Z
freqBodyAccJerk.mean...X
freqBodyAccJerk.mean...Y
freqBodyAccJerk.mean...Z
freqBodyAccJerk.meanFreq...X
freqBodyAccJerk.meanFreq...Y
freqBodyAccJerk.meanFreq...Z
freqBodyGyro.mean...X
freqBodyGyro.mean...Y
freqBodyGyro.mean...Z
freqBodyGyro.meanFreq...X
freqBodyGyro.meanFreq...Y
freqBodyGyro.meanFreq...Z
freqBodyAccMagnitude.mean..
freqBodyAccMagnitude.meanFreq..
freqBodyAccJerkMagnitude.mean..
freqBodyAccJerkMagnitude.meanFreq..
freqBodyGyroMagnitude.mean..
freqBodyGyroMagnitude.meanFreq..
freqBodyGyroJerkMagnitude.mean..
freqBodyGyroJerkMagnitude.meanFreq..
angle.tBodyAccMean.Gravity.
angle.tBodyAccJerkMean..GravityMean.
angle.tBodyGyroMean.GravityMean.
angle.tBodyGyroJerkMean.GravityMean.
angle.X.GravityMean.
angle.Y.GravityMean.
angle.Z.GravityMean.
timeBodyAcc.std...X
timeBodyAcc.std...Y
timeBodyAcc.std...Z
timeGravityAcc.std...X
timeGravityAcc.std...Y
timeGravityAcc.std...Z
timeBodyAccJerk.std...X
timeBodyAccJerk.std...Y
timeBodyAccJerk.std...Z
timeBodyGyro.std...X
timeBodyGyro.std...Y
timeBodyGyro.std...Z
timeBodyGyroJerk.std...X
timeBodyGyroJerk.std...Y
timeBodyGyroJerk.std...Z
timeBodyAccMagnitude.std..
timeGravityAccMagnitude.std..
timeBodyAccJerkMagnitude.std..
timeBodyGyroMagnitude.std..
timeBodyGyroJerkMagnitude.std..
freqBodyAcc.std...X
freqBodyAcc.std...Y
freqBodyAcc.std...Z
freqBodyAccJerk.std...X
freqBodyAccJerk.std...Y
freqBodyAccJerk.std...Z
freqBodyGyro.std...X
freqBodyGyro.std...Y
freqBodyGyro.std...Z
freqBodyAccMagnitude.std..
freqBodyAccJerkMagnitude.std..
freqBodyGyroMagnitude.std..
freqBodyGyroJerkMagnitude.std..


