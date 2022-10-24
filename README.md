# Getting and Cleaning Data Final Project

This is R.L.Dittmar's submission for the "Getting and Cleaning Data Final Course Project. The script in this set is to analyze activity data from a wearable device.

## Repository contents

This repository contains:

**1.) 'run_analysis.R'** 

This is a script to:
- Download the data and read it into R.
- Perform sanity checks
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement. 
- Use descriptive activity names to name the activities in the data set
- Appropriately label the data set with descriptive variable names. 
- Create a second, independent tidy data set with the average of each variable for each activity and each subject.

**2.) 'readme.Md':** A markdown file introducing the project

**3.) 'codebook.Md':** A markdown file describing the variables, the data, and transformations or work performed in the original data and done to clean up the data to export a tidy data summary table.

**4.) final_tidy_data.csv:** The final, tidy data table that was exported at the end of the 'run_analysis.R' script.

## Original Data
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

The processed data in this repository was collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from the Smartlab - Non Linear Complex Systems Laboratory at DITEN - Universit‡ degli Studi di Genova located at Via Opera Pia 11A, I-16145, Genoa, Italy.
