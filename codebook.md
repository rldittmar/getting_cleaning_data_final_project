---
title: "Codebook template"
author: "Rachel L. Dittmar"
date: "10-24-2022"
---
# Getting and Cleaning Data - Final Course Project Codebook

This codebook describes the variables, the data, and transformations or work done to clean up the data and export a tidy data summary table. 

The codebook and its accompanying script and readme were prepared by R.L.Dittmar. 

Scipt: run_analysis.R
Link: <u>https://github.com/rldittmar/getting_cleaning_data_final_project/blob/c568c073d4ef1b54c22f821dcf49c265238ebc59/run_analysis.R

Readme: README.md
Link: 
<u>https://github.com/rldittmar/getting_cleaning_data_final_project/blob/c568c073d4ef1b54c22f821dcf49c265238ebc59/README.md
  


  ## Project Description

Thirty subjects were recruited for this study and randomly partitioned into a training cohort (N = 21) and a test cohort (N = 9). All participants were between ages of 19 and 48. Each subject engaged in six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a Samsung Galaxy S II smartphone on their waiste. This device contains an accelerometer and gyroscope, allowing the capture of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. Data were mually annotated from video recordings of the experiments. 

# Original Data 

## Study design and data processing

The acceleratometer and gyroscope signals were filtered to reduce noise and sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signals have two components: gravitational and body motion. These components were separated using Butterworth low-pass filtering into body acceleration and gravity. A 0.3 hz cutt off frequency filter was used because the gravitation force is expected to contain only low frequency components. A vector of features was created by calculating variables fromt he time and frequency domain for each window. 

- Each feature was normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

### Collection of the raw data

Data for six different activities (walking, walking upstiars, walking downstairs, sitting, standing, and laying) were collected from 30 participants ages 19 to 48. Each participate work a Samsung Galaxy SII smart phone containign an accelerometer and gyroscope to record 3-axial linear acceleartion and 3-axial anu velocity at a rate of 50 HZ.

### The original (raw) data contained the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

### The following additional orignal files were also available, but not used: 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


### Explanation of features in the original data set and used for assignment processing

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

### Notes on the original (raw) data 

The data were collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from the Smartlab - Non Linear Complex Systems Laboratory at DITEN - Universit‡ degli Studi di Genova located at Via Opera Pia 11A, I-16145, Genoa, Italy.

Website with information about these data:
<u> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The original data can be downloaded here.  <u>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Processing of Data for "Getting and Cleaning Data Course Project"
  
## Creating the tidy datafile
  
The file "run_analysis.R" processes the original data (detailed above) as follows in the subsequent text. 

The original data were not tidy for several reason, including:
- The data were split into a test and training set
- The data contained additional, unnecessary variables
- Variable names were not descriptive
- Activity names were not descriptive
- There were multiple measurement for each subject for each activity

### Guide to create the tidy data file

The script can be foun

#### Step 0: Load relevant libraries and prepare environment.
  
```
library("dplyr")
library("tidyr")
library("stringr")
```

If desired, you may set your working directory.

```
setwd("path")
```
If desired, you may set your seed the same as I did, though it shouldn't be necessary for this script.
  
```
set.seed(215)
```
  
#### Step 1: Download the data from <u>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
  
Data can be downloaded using this code:

```
filename <- "final_probject.zip"

        ## Checking if directory already exists.
        if (!file.exists(filename)){
                fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileURL, filename, method="curl")
        }

        ## Checking if folder exists
        if (!file.exists("UCI HAR Dataset")) { 
                unzip(filename) 
        }
```
#### Step 2: Read in the text files and name the variable columns appropriately. 

For a detailed explanation of each text file read in, please see the "Original Data" section of this codebook.
  
  ```
        features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","feature"))
        # Dimensions should be: 561 observations of 2 varialbes.
                    
        activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names =         c("code","activity"))
        # Dimensions should be: 6 observations of 2 variables
  
        test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
        # Dimensions should be: 2947 observations of 1 variable
        
        test_x <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
        # Dimensions should be: 2947 observations of 561 variables
        
        test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
        # Dimensions should be: 2947 observations of 1 variable
            
        train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
        # Dimensions should be: 7352 observations of 1 variable
  
        train_x <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
        # Dimensions should be: 7352 observations of 561 variables
                   
        train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
        # Dimensions should be: 7352 observations of 1 varible
```
Any object with "test" in the title came from the testing cohort and any object with "train" in the title came from the training cohort.
  
The "features" object contains the names of each measurement performed. This file was used to name the features/variables when reading in the "x" objects. 
  
The "activities" object (activities) contained the numerical code for each activity performed for each measurement. 
  
The "sub" objects (test_sub and train_sub) contain the subject IDs for each measurement that was collected.  The "x" objects (test_x and train_x) contained the measurements for each subject for each activity for each variable. Each activity contained multiple measurements (observations). The "y" objects (test_y and train_y) indicate which activity was done for each measurement. 

#### Step 4: Sanity Checks to ensure data was loaded correctly

Check that the total # of subjects in the combined training and test data sets equal 30. 

  ```
  count(unique(test_sub)) + count(unique(train_sub))
  # This should be 30. If not, check that the data were loaded correctly.
  ```
  
Verify that there were no overlapping subject IDs between the training and test data sets (each subject was only included in one data set, so there should be no overlaps). 

  ```
  sum(test_sub$ID %in% train_sub$ID) == FALSE
  # This should be true. If false, check the data were loaded correctly.
  ```
  
Verify that the number of rows in the subject files were the same as the number of rows in the x and y files. 

  ```
  nrow(test_sub) == nrow(test_x) & nrow(test_y)
  nrow(train_sub) == nrow(train_x) & nrow(train_y)
   # These should be true. If false, check the data were loaded correctly.
  ```

#### Step 5: Combine data

Combine the training data sets to form an object called "training_merged". This included the "subject" column of train_sub, the "acitivity" column of train_y, and all measurements of the varialbes in train_x. 

Repeat with the test data sets to form an object called "test_merged".
  
```
train_merged <- cbind(train_sub["subject"], train_y["activity"], train_x[,1:ncol(train_x)])
                
test_merged <- cbind(test_sub["subject"], test_y["activity"], test_x[,1:ncol(train_x)])
```
Dimensions of train_merged should be: 7352 observations of 563 variables
Dimensions of test_merged should be: 2947 observations of 563 variables
 
Make sure that the variable (column) names match and are in the same order between the merged training and merged test datasets. Also make sure there are the same # of variables in each dataset.
  
```
sum(names(test_merged) == names(train_merged)) == ncol(test_merged) & ncol(train_merged)
# This should be TRUE

merged <- rbind(train_merged, test_merged)
```
Dimensions should be: 10299 observations of 563 variables

### Cleaning of the data

#### Step 6: Extract only the measurements on the mean and standard deviation for each variable. 

Select only columns containing mean or std (abbreviation for standard deviation)

```
mean_std <- merged %>%
select(subject, activity, contains("mean"), contains("std"))
```
Dimensions should be: 10299 observations of 88 variables
  
#### Step 7: Uses descriptive activity names to name the activities in the data set        

Change activity to character for use with stringr. Then, replace the activity number with a description of the activity. Please note that "upstairs" means walking upstairs. Similarly, "downstairs" means walking downstairs.
  
```
 mean_std$activity <- as.character(mean_std$activity)
        mean_std$activity <-case_when(
                str_detect(mean_std$activity, "1") ~ 'walking',
                str_detect(mean_std$activity, "2") ~ 'upstairs',
                str_detect(mean_std$activity, "3") ~ 'downstairs',
                str_detect(mean_std$activity, "4") ~ 'sitting',
                str_detect(mean_std$activity, "5") ~ 'standing',
                str_detect(mean_std$activity, "6") ~ 'laying')
          )

Dimensions should still be: 10299 observations of 88 variables
```
#### Step 8: Appropriately labels the data set with descriptive variable names. 

To keep variable names tidy, all variable names were changed to lower case.

```
names(mean_std) <- tolower(names(mean_std))
```
Dimensions should still be: 10299 observations of 88 variables
  
All variables/features were named in a descriptive manner.

 ```
  names(mean_std) <- gsub("\\s", "", names(mean_std))
        # Replace "t" with time
        names(mean_std) <- gsub("^t", "time.", names(mean_std))
        # Replace "f" with frequency
        names(mean_std) <- gsub("^f", "frequency.", names(mean_std))
        # Replace "acc" with accelerometer
        names(mean_std) <- gsub("acc", "accelerometer.", names(mean_std))
        # Repalce "gyro" with gyroscope
        names(mean_std) <- gsub("gyro", "gyroscope.", names(mean_std))
        # Replace "tbody" with "time.body"
        names(mean_std) <- gsub("tbody", "time.body", names(mean_std))
        # Replace "mag" with "magnitude"
        names(mean_std) <- gsub("mag", "magnitude", names(mean_std))
        # Replace "body.body" with "body"
        names(mean_std) <- gsub("bodybody", "body", names(mean_std))
        # Replace "body" with "body". to introduce period for easier reading
        names(mean_std) <- gsub("body", "body.", names(mean_std))
        # Replace "gravity" with "gravity." to introduce period for easier reading
        names(mean_std) <- gsub("gravity", "gravity.", names(mean_std))
        # Replace "tbody" with "time.body"
        names(mean_std) <- gsub("tbody", "time.body", names(mean_std))
        # Replace "mag" with "magnitude"
        names(mean_std) <- gsub("mag", "magnitude", names(mean_std))
        # Replace multiple periods with one period
        names(mean_std) <- gsub("\\.+", ".", names(mean_std))
        # Replace "jerkmagnitude" with "jerk.magnitude" to introduce period for easier reading
        names(mean_std) <- gsub("jerkmag", "jerk.mag", names(mean_std))
        # Replace "jerkmean" with "jerk.mean" to introduce period for easier reading
        names(mean_std) <- gsub("jerkmean", "jerk.mean", names(mean_std))
        # Replace "meanfreq" with "mean.frequency" to introduce period for easier reading
        names(mean_std) <- gsub("meanfreq", "mean.frequency", names(mean_std))
        # Remove any periods at the end of a line
        names(mean_std) <- gsub("\\.$", "", names(mean_std))
 ```
 Dimensions should still be: 10299 observations of 88 variables
  
 Please note: 
 - All variable names are in lower case
 - Periods between words have been added for enhanced readability
 - If you prefer no periods, please run the following to remove them:
 
  ``` 
 names(mean_std) <- gsub("\\.", "", names(mean_std))
 ```
                    
 Dimensions should still be: 10299 observations of 88 variables

 ### Creation of the tidy data file
 
 #### Step 9: Set the subject and activity columns as factors
 
 Numeric values represent subjects, however these values are actually factors.
                    
 ```
  mean_std$subject <- as.factor(mean_std$subject)
        mean_std$activity <- as.factor(mean_std$activity)
 ```
 Dimensions should still be: 10299 observations of 88 variables
                             
 #### Step 10: Create an independent, tidy data table.
 
 This table summarizes the data.
 
 Each row represents the mean of the variables for one activity for one subject. For example, row 1 may contain the mean of all measurement taken from subject #1  while standing. Row 2 may contain the mean of all measurements taken from subject #1 while sitting. Etc.

```
final_tidy <- mean_std %>%
                group_by(subject, activity) %>%
                summarise_all(list(mean))
```
Dimensions should be: 180 observations of 88 variables

#### Step 11: Export the tidy data table.
 
The below code exports the data table to the current working director.

To export to a different directory, remove the first "." and replace with the desired file path.
  
```
write.table(mean_std, file = "./final_tidy_data.csv", col.names = TRUE)

```
Dimensions should be: 180 observations of 88 variables


## Description of the variables in the tiny_data.txt file

### Variable 1
- Subject identifier number
- Each subject only has one number
- Class = factor with 30 levels (1:30)
- No unit of measurement
  
### Variable 2: 
- Activity done with the measurements were performed
- Class = factor with 6 levels (standing, walking, upstairs, downstairs, sitting, laying)
- No unit of measurement
 
### The remaining variables (3:88) are all numeric in class and have pattern names where:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time.accelerometer-XYZ and time.gyrometer-XYZ. These time domain signals (prefix "time" to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.body.accelerometer-XYZ and time.gravity.accelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.body.acceleromenter.jerk-XYZ and time.body.gyrometer.jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time.body.accelerometer.magnitude, time.gravity.accelerometer.magnitude, time.body.accelerometer.jerk.magnitude, time.body.gyrometer.magnitude, time.body.gyrometer.jerk.magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency.body.accelerometer-XYZ, frequency.body.accelerometer.jerk-XYZ, frequency.body.gyrometer-XYZ, frequency.body.accelerometer.jerk.magnitude, frequency.body.gyrometer.magnitude, fBodyGyroJerkMag. (Note the "frequency" to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time.body.accelerometer-XYZ
time.gravity.accelerometer-XYZ
time.body.accelerometer.jerk-XYZ
time.body.gyroscope-XYZ
time.body.gyroscope.jerk-XYZ
time.body.accelerometer.magnitude
time.gravity.accelerometer.magnitude
time.body.accelerometer.jerk.magnitude
time.body.gyroscopeMag
time.body.gyroscopeJerkMag
frequency.body.accelerometer-XYZ
frequency.body.accelerometer.jerk-XYZ
frequency.body.gyroscope-XYZ
frequency.body.accelerometer.magnitude
frequency.body.accelerometer.jerk.magnitude
frequency.body.gyroscope.magnitude
frequency.body.gyroscope.jerk.magnitude

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravity.mean
time.body.accelerometer.mean
time.body.accelerometer.jerk.mean
time.body.gyroscope.mean
time.body.gyroscope.jerk.mean

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mean.freq(): Weighted average of the frequency components to obtain a mean frequency  
angle(): Angle between two vectors.

## Sources

### Original data:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Help on the assignment
<u> https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
<u> https://drive.google.com/file/d/1TiA9Re1y16HTJ_7xUvsW1V15blzjvj03/view
<u> https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks
<u> https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41
<u> https://rpubs.com/ninjazzle/DS-JHU-3-4-Final
<u> 

## Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
