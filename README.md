# Getting and Cleaning Data Final Project

The processed data in this repository was collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from the Smartlab - Non Linear Complex Systems Laboratory at DITEN - Universit‡ degli Studi di Genova located at Via Opera Pia 11A, I-16145, Genoa, Italy.

## Repository contents

This repository contains:
- 1.) 'run_analysis.R' - This is a script to tidy, merge, and summarize the data as required. 
- 2.) 'readme.Md' - A markdown file explaining the data and their analyses 
- 3.) 'codebook.Md' - A markdown file explaning the meaning of each variable

## Original Data - As paraphrased or directly copied from the original "readme.txt" file:

The original data can be downloaded here.  <u>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data can be read into R as follows:

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
Thirty subjects were recruited for this study and randomly partitioned into a training cohort (N = 21) and a test cohort (N = 9). All participants were between ages of 19 and 48. Each subject engaged in six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a Samsung Galaxy S II smartphone on their waiste. This device contains an accelerometer and gyroscope, allowing the capture of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. Data were mually annotated from video recordings of the experiments. 

The acceleratometer and gyroscope signals were filtered to reduce noise and sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signals have two components: gravitational and body motion. These components were separated using Butterworth low-pass filtering into body acceleration and gravity. A 0.3 hz cutt off frequency filter was used because the gravitation force is expected to contain only low frequency components. A vector of features was created by calculating variables fromt he time and frequency domain for each window. 

### Notes

- Each feature was normalized and bounded within [-1,1].
- Each feature vector is a row on the text file. 

### The original data contained the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

### The following additional files were also available, but not used: 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Information about the features in the original data:


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

## Data processing with run_analysis.R

The file "run_analysis.R" processes the original data as follows in the subsequent text.

### Reading in the data and sanity checks

Files were read in and given column names as shown in the script. After reading in the relevant files (features.txt, activity_labels.txt, subject_test.txt, X_test.txt, y_test.txt, subject_train, X_train.txt, y_train.txt), sanity checks were performed. 
These included:

- Checking that the total # of subjects in the combined training and test data sets equaled 30. 
- Verifying that there were no overlapping subject IDs between the training and test data sets (each patients was only included in one
- Verifying that the number of rows in the subject files were the same as the number of rows in the x and y files. 

### Merging the data

For each data set (training and test) the subject ids from the subject file, activities from the y file, and the features/values from the x file were merged into one data set.

After ensuring that the column names of the x and y data were identical, the data were merged vertically. 

Please note that each row represents one measurement of one subject for one activity. Each subject has multiple measurements for each activity. 

### Select measurements

The assignment called to keep the variables containing "mean" or "std", but did not explain in more detail exactly what this mean. As such, all columns containing the words "mean" or "std" were kept. 

### Descriptive activity names

Descriptive activity names were added to the "activity" column, replacing the numerical identifiers. Upstairs means walking upstairs and downstairs means walking downstairs.

### Descriptive varaible names

To tidy the data, all column names were changed to lower case. Then column names were renamed in a descriptive manner. Periods between words within a column name have been added for enhanced readability. If you prefer no periods, run:

```
names(mean_std) <- gsub("\\.", "", names(mean_std))
```

### Summarizing the data by creating a a second, independent tidy data set with the average of each variable for each activity and each subject.
 
 The 'subject' and 'activity' columns were set as factors. Data were grouped by subject and activity, then summarized by the mean. This results in a final, tidy data table with each row representing the mean of all variables for one activity for one subject.            

## References

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
