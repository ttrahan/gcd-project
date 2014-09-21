Getting and Cleaning Data - Course Project
==================================================================
Codebook for:
==================================================================

Program for Cleaned and Transformed Data Set Ready for Analysis
of the Mean of all Mean and Std Dev Calculations in the *Human Activity Recognition Using Smartphones Dataset*  
Version 1.0  
Program author: Tom Trahan  
(see below for ORIGINAL CODEBOOK FROM THE STUDY AUTHORS)  

----------

The run_analysis.R program will produce a dataset based on the data from the source study.  The details of the original source study variables are below under Original Codebook from Study Authors.  

This dataset contains two dimensions:

subject  
  - Type: integer  
  - Identifies the study subject  
  - The data set contains data on 30 subjects, 1-30  

activity  
  - Type: character  
  - Identifies the activity a subject was performing when a measurement was taken  
  - The data set contains six possible values:  
   * WALKING  
   * WALKING_UPSTAIRS  
   * WALKING_DOWNSTAIRS  
   * LAYING  
   * SITTING    
   * STANDING    


This dataset contains 66 calculated measures.  Each contains the average of the MEAN and STD DEV calculations for all measurements reported by the source authors for each Subject/Activity combination.  

avg_tBodyAcc-mean()-X
avg_tBodyAcc-mean()-Y
avg_tBodyAcc-mean()-Z
avg_tBodyAcc-std()-X
avg_tBodyAcc-std()-Y
avg_tBodyAcc-std()-Z
avg_tGravityAcc-mean()-X
avg_tGravityAcc-mean()-Y
avg_tGravityAcc-mean()-Z
avg_tGravityAcc-std()-X
avg_tGravityAcc-std()-Y
avg_tGravityAcc-std()-Z
avg_tBodyAccJerk-mean()-X
avg_tBodyAccJerk-mean()-Y
avg_tBodyAccJerk-mean()-Z
avg_tBodyAccJerk-std()-X
avg_tBodyAccJerk-std()-Y
avg_tBodyAccJerk-std()-Z
avg_tBodyGyro-mean()-X
avg_tBodyGyro-mean()-Y
avg_tBodyGyro-mean()-Z
avg_tBodyGyro-std()-X
avg_tBodyGyro-std()-Y
avg_tBodyGyro-std()-Z
avg_tBodyGyroJerk-mean()-X
avg_tBodyGyroJerk-mean()-Y
avg_tBodyGyroJerk-mean()-Z
avg_tBodyGyroJerk-std()-X
avg_tBodyGyroJerk-std()-Y
avg_tBodyGyroJerk-std()-Z
avg_tBodyAccMag-mean()
avg_tBodyAccMag-std()
avg_tGravityAccMag-mean()
avg_tGravityAccMag-std()
avg_tBodyAccJerkMag-mean()
avg_tBodyAccJerkMag-std()
avg_tBodyGyroMag-mean()
avg_tBodyGyroMag-std()
avg_tBodyGyroJerkMag-mean()
avg_tBodyGyroJerkMag-std()
avg_fBodyAcc-mean()-X
avg_fBodyAcc-mean()-Y
avg_fBodyAcc-mean()-Z
avg_fBodyAcc-std()-X
avg_fBodyAcc-std()-Y
avg_fBodyAcc-std()-Z
avg_fBodyAccJerk-mean()-X
avg_fBodyAccJerk-mean()-Y
avg_fBodyAccJerk-mean()-Z
avg_fBodyAccJerk-std()-X
avg_fBodyAccJerk-std()-Y
avg_fBodyAccJerk-std()-Z
avg_fBodyGyro-mean()-X
avg_fBodyGyro-mean()-Y
avg_fBodyGyro-mean()-Z
avg_fBodyGyro-std()-X
avg_fBodyGyro-std()-Y
avg_fBodyGyro-std()-Z
avg_fBodyAccMag-mean()
avg_fBodyAccMag-std()
avg_fBodyBodyAccJerkMag-mean()
avg_fBodyBodyAccJerkMag-std()
avg_fBodyBodyGyroMag-mean()
avg_fBodyBodyGyroMag-std()
avg_fBodyBodyGyroJerkMag-mean()
avg_fBodyBodyGyroJerkMag-std()


Original Codebook from Study Authors ('features_info.txt')  
=================
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:  

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.  
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal  
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in 'features.txt'  
