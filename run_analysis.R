
# Course Project - Getting and Cleaning Data ------------------------------

## The purpose of this project is to demonstrate your ability to collect, work with,
## and clean a data set. The goal is to prepare tidy data that can be used for later
## analysis. You will be graded by your peers on a series of yes/no questions 
## related to the project. You will be required to submit: 1) a tidy data set as 
## described below, 2) a link to a Github repository with your script for performing
## the analysis, and 3) a code book that describes the variables, the data, and any 
## transformations or work that you performed to clean up the data called 
## CodeBook.md. You should also include a README.md in the repo with your scripts. 
## This repo explains how all of the scripts work and how they are connected.  

## One of the most exciting areas in all of data science right now is wearable 
## computing - see for example  this article . Companies like Fitbit, Nike, and 
## Jawbone Up are racing to develop the most advanced algorithms to attract new 
## users. The data linked to from the course website represent data collected from 
## the accelerometers from the Samsung Galaxy S smartphone. A full description is 
## available at the site where the data was obtained: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## 
## Here are the data for the project: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
## Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
## WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
##
## You should create one R script called run_analysis.R that does the following. 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each 
##   measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.

# Code --------------------------------------------------------------------


# Step 1 ------------------------------------------------------------------
## Merge the training and test sets

## file downloaded and extracted in "getdata_projectfiles_UCI HAR Dataset" folder
## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download(fileUrl, destfile=datafile<-"".\\Getting and Cleaning Data\\UCI.zip")
## 
## Path to data folders:
## .//Getting and Cleaning Data//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset
##      //test
##      //train

# load libraries
library(dplyr)
library(plyr)
library(data.table)
library(gsubfn)

# set location for downloaded data where source files were extracted
wd <- c("C:/Users/tomtra/SkyDrive/Coursera/Data Science Specialization/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
if(getwd() != wd) {
        setwd("C://Users//tomtra//SkyDrive//Coursera//Data Science Specialization//Getting and Cleaning Data//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset")        
}
rm(wd)

# get feature labels
features <- fread("features.txt", sep="auto", header=FALSE)
setnames(features,1:2,c("featureid","feature"))

# get activity labels
activities <- fread("activity_labels.txt", sep="auto", header=FALSE)
setnames(activities,1:2,c("activityid", "activity"))
setkey(activities, activityid)

# get x data
xtraindata <- data.table(read.table(".//train//X_train.txt", 
                                           sep="", header=FALSE))
xtestdata <- data.table(read.table(".//test//X_test.txt", 
                                          sep="", header=FALSE))

# get subject data and bind to x data
# note that there is one row in subject data that maps row for row in x data.
subjecttraindata <- fread(".//train//subject_train.txt", 
                      sep="auto", header=FALSE)
setnames(subjecttraindata,1,"subject")
subjecttestdata <- fread(".//test//subject_test.txt", 
                     sep="auto", header=FALSE)
setnames(subjecttestdata,1,"subject")
xtraindata <- data.table(cbind(subjecttraindata, xtraindata))
xtestdata <- data.table(cbind(subjecttestdata, xtestdata))

# add column to each x dataset to identify test vs. train data
xtraindata <- data.table(cbind(sample="train", xtraindata))
xtestdata <- data.table(cbind(sample="test",xtestdata))

# get y data
ytraindata <- fread(".//train//y_train.txt", sep="auto", header=FALSE)
ytestdata <- fread(".//test//y_test.txt", sep="auto", header=FALSE)
setnames(ytraindata,"V1","activityid")
setnames(ytestdata,"V1","activityid")

# merge y data with x data for both samples
# note that there is one row in y data that maps row for row in x data.
traindata <- data.table(cbind(xtraindata[,1:2,with=FALSE],ytraindata, 
                   xtraindata[,3:ncol(xtraindata),with=FALSE]))
testdata <- data.table(cbind(xtestdata[,1:2,with=FALSE],ytestdata, 
                  xtestdata[,3:ncol(xtestdata),with=FALSE]))

# merge train data with test data into single data set
columns <- intersect(names(traindata), names(testdata))
alldata <- data.table(merge(traindata, testdata, by=columns, all=TRUE))


# Step 2 ------------------------------------------------------------------
## Extract only the measurements on the mean and standard deviation
## 
## mean rows from the features table, with labels containing mean() and std()
meanrows <- grep("mean()", features$feature, fixed=TRUE)

## std dev rows from the features table
stdrows <- grep("std()", features$feature, fixed=TRUE)

## all mean and std dev rows from the features table
meanstdrows <- sort(as.vector(rbind(meanrows, stdrows)))

## the rows in the features table equate to measurement columns in the x and 
## y data sets.  since two columns were added to traintestdata in positions 1:2, 
## add 2 to all values in meanrows and stdrows to map features.rows to x or y
## dataset columns.
meanstdcols <- meanstdrows + c(3)

## filter alldata for only the added columns and those that map to the 
## features for mean and std dev
alldatameanstd <- data.table(alldata[,c(1:3,meanstdcols),with=FALSE])
setkey(alldatameanstd,sample,subject,activityid)

# Step 3 ------------------------------------------------------------------
## Add descriptive activity names to data set
## these were found in the activity_labels.txt source file
alldatameanstd <- data.table(join(alldatameanstd,activities))
## move activity column to the fourth position
alldatameanstd <- select(alldatameanstd,sample:activityid,activity,V1:V543)

# Step 4 ------------------------------------------------------------------
## add the "features" column labels to data for mean and std dev values
## to use as descriptive variable names
featuresmeanstd <- data.table(features[meanstdrows,1:2,with=FALSE])
for(i in 1:nrow(featuresmeanstd)) {
        names(alldatameanstd)[i+4] <- as.character(
                featuresmeanstd[i,2,with=FALSE])
}

## save tidy data set to file
write.table(alldatameanstd, file="alldata_meanstd_tidy.txt", row.name=FALSE)

# Step 5 ------------------------------------------------------------------
## From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each subject and activity.
avgalldata <- alldatameanstd %>%
                group_by(subject, activity) %>%
                select(subject, activity, c(5:70)) %>%
                summarise_each(funs(mean))

## rename columns with prefix "avg_" to relect the transformed variables
for(i in 3:ncol(avgalldata)) {setnames(avgalldata,i,paste("avg",
                                names(avgalldata[,i,with=FALSE]),sep="_"))}
## save tidy data set to file
write.table(avgalldata, file="avgalldata_tidy.txt", row.name=FALSE)
write.table(names(avgalldata),file="avgalldata_variables.txt", row.name=FALSE)

