library("dplyr")
library("tidyr")
library("stringr")

# Set your working directory
setwd("~/R/Coursera/Getting_and_Cleaning_Data/Final_Project")

# Set seed
set.seed(215)

# Download data
# Please skip this section if the data has already been loaded and proceed to "Read in text files"

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

# Read in text files
        features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","feature"))
        activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
        test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
        test_x <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
        test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
        train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
        train_x <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
        train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

# Sanity Checks

        ## Check that total number of participants = 30
                ### If other than 30, double check data loaded correctly
        count(unique(test_sub)) + count(unique(train_sub))

        ## Verify there is no overlap in subjects between the data sets
                ### If false, double check data loaded correctly
                sum(test_sub$ID %in% train_sub$ID) == FALSE

        ## Are the # of rows in sub files the same as the # of rows in the train/test files?
                ### If false, double check data loaded correctly
                nrow(test_sub) == nrow(test_x) & nrow(test_y)
                nrow(train_sub) == nrow(train_x) & nrow(train_y)

# Assignment Task #1: Merge the training and the test sets to create one data set.

        ## Combine x, y, and sub for test and training sets
        train_merged <- cbind(train_sub["subject"], train_y["activity"], train_x[,1:ncol(train_x)])
        test_merged <- cbind(test_sub["subject"], test_y["activity"], test_x[,1:ncol(train_x)])

        ## Make sure that the column names match and rbind
        sum(names(test_merged) == names(train_merged)) == ncol(test_merged) & ncol(train_merged)
        merged <- rbind(train_merged, test_merged)

# Assignment Task #2:Extract only the measurements on the mean and standard deviation for each measurement. 

        ## Select any columns containing mean or std (abbreviation for standard deviation) 
        mean_std <- merged %>%
                select(subject, activity, contains("mean"), contains("std"))

# Assignment Task #3: Uses descriptive activity names to name the activities in the data set        
        
        ## rename activity names
        mean_std$activity <- as.character(mean_std$activity)
        mean_std$activity <-case_when(
                str_detect(mean_std$activity, "1") ~ 'walking',
                str_detect(mean_std$activity, "2") ~ 'upstairs',
                str_detect(mean_std$activity, "3") ~ 'downstairs',
                str_detect(mean_std$activity, "4") ~ 'sitting',
                str_detect(mean_std$activity, "5") ~ 'standing',
                str_detect(mean_std$activity, "6") ~ 'laying'
        )
        
# Assignment Task #4: Appropriately labels the data set with descriptive variable names. 
        
        ## Make all col names lower case
        names(mean_std) <- tolower(names(mean_std))
                
        ## rename features/variables in a descriptive manner
        names(mean_std) <- gsub("\\s", "", names(mean_std))
        names(mean_std) <- gsub("^t", "time.", names(mean_std))
        names(mean_std) <- gsub("^f", "frequency.", names(mean_std))
        names(mean_std) <- gsub("acc", "accelerometer.", names(mean_std))
        names(mean_std) <- gsub("gyro", "gyroscope.", names(mean_std))
        names(mean_std) <- gsub("tbody", "time.body", names(mean_std))
        names(mean_std) <- gsub("bodybody", "body", names(mean_std))
        names(mean_std) <- gsub("body", "body.", names(mean_std))
        names(mean_std) <- gsub("gravity", "gravity.", names(mean_std))
        names(mean_std) <- gsub("tbody", "time.body", names(mean_std))
        names(mean_std) <- gsub("mag", "magnitude", names(mean_std))
        names(mean_std) <- gsub("\\.+", ".", names(mean_std))
        names(mean_std) <- gsub("jerkmagnitude", "jerk.magnitude", names(mean_std))
        names(mean_std) <- gsub("jerkmean", "jerk.mean", names(mean_std))
        names(mean_std) <- gsub("meanfreq", "mean.frequency", names(mean_std))
        names(mean_std) <- gsub("\\.$", "", names(mean_std))
        
        ## Note: variable names are all in lowercase
        ## Periods between words have been added for enhanced readability
        ## If you prefer no periods, remove the "###" of the line below and run:
                ### names(mean_std) <- gsub("\\.", "", names(mean_std))

# Assignment Task #5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
        
        ## Set subject and activity as factors
        mean_std$subject <- as.factor(mean_std$subject)
        mean_std$activity <- as.factor(mean_std$activity)

        ## Create independent tidy data table
        final_tidy <- mean_std %>%
                group_by(subject, activity) %>%
                summarise_all(list(mean))
        
        ## Export data table to current working directory for future use
        ## To export to a different directory, replace the first "." with your desired file path
        write.table(mean_std, file = "./final_tidy_data.csv", col.names = TRUE)

        
