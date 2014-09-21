Getting and Cleaning Data - Course Project
==================================================================
Program for Cleaned and Transformed Data Set Ready for Analysis
of the Mean of all Mean and Std Dev Calculations in the *Human Activity Recognition Using Smartphones Dataset*  
Version 1.0  
(see below for ORIGINAL README FROM THE STUDY AUTHORS)  
Program author: Tom Trahan

----------

The provided cleaned and transformed data set prepares the data gathered by the Human Activity Recognition Using Smartphones research study for ease of analysis and calculates the mean of all mean and std deviation calculations provided in the original dataset, by subject and activity.

####The data required for this analysis is provided in seven files in the original study data:

   * 'features.txt'  
   * 'activity_labels.txt'  
   * 'train/X_train.txt'  
   * 'train/y_train.txt'  
   * 'test/X_test.txt'  
   * 'test/y_test.txt'  
   * 'train/subject_train.txt'  
   * 'test/subject_test.txt'   
(Descriptions for each data set appear in the original README below)

####The following steps were performed to prepare the data set:

1.  Download source data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2.  Merge the training and test subject data sets and the related dimensional data  
   * Read 'features.txt' into table and add column names  
   * Read 'activity_labels.txt' into table, add column names, and set key fields  
   * Read measurement data for training and test subjects (X data) into table from 'train/X_train.txt' and 'test/X_test.txt'  
   * Read subject data for training and test subjects from 'train/subject_train.txt' and 'test/subject_test.txt', add column names, and bind to X data  
   * Add column to each X dataset to identify training vs. test subjects  
   * Read activity data from 'train/y_train.txt' and 'test/y_test.txt' for each X dataset, add column names, bind to X data, and re-order columns to place dimensions in first column positions  
   * Merge X datasets into single, consolidated dataset  
3.  Limit scope of consolidated dataset to only the mean and standard deviation calculations and set key fields
4.  Add descriptive activity names to the consolidated dataset taken from 'activity_labels.txt'
5.  Name calculation columns in the consolidated dataset taken from 'features.txt'
6.  Calculate the average of all mean and standard deviation calculations in the consolidated data set for each subject/activity combination, rename columns with prefix "avg_"

Executing the program will perform steps 2-6 above and write the resulting dataset to your working directory.  Prior to executing the program (run_analysis.R), extract all source files (step 1) into your working directory and edit rows 59 and 61 in the program with your desired working directory location.



ORIGINAL README FROM SOURCE STUDY
==================================================================
###Human Activity Recognition Using Smartphones Dataset
###Version 1.0

==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
