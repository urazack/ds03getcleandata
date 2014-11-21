run_analysis <- function() {
        ## Introductory notes:        
        # This script requires that the Samsung data is in your working directory.
        # You can download the Samsung data from the URL below. If this data is unzipped correctly
        # you should have a folder titled "UCI HAR Dataset" in your working directory.
        # URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
        
        # Alternatively, you can just remove the hashtags (#) in the margins infront of the code in 
        # the "Get Data" section. This code will automatically download and unzip the required 
        # Samsung data into your working directory.
        
        # Script begins
        # ------------------------------------------------------------------------------------------
        
        # Load required packages
        library(data.table)
        
        # Get Data
        # Download and unzip data to working directory
#         download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "SamsungData.zip")
#         unzip("SamsungData.zip")
        
        # Read in all files required for analysis
        testX <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
        testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
        testY <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)
        trainX <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)
        trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F)
        trainY <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)
        features <- read.table("UCI HAR Dataset/features.txt", header=F)
        activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)
        
        ### Course Project: Part 4
        ### "Appropriately labels the data set with descriptive variable names"
        
        # Give datasets headers i.e. column descriptions
        names(testSubject) <- "Subject"
        names(trainSubject) <- "Subject"
        names(testY) <- "Activity"
        names(trainY) <- "Activity"
        colnames(testX) <- features[,2]
        colnames(trainX) <- features[,2]
        
        ### Course Project: Part 1
        ### "Merges the training and the test sets to create one data set"
        
        # Create an empty master dataframe. This dataframe will be used to compile
        # all the data required for this analysis
        df <- data.frame()
        
        # Combine the X datasets. This constitutes the bulk of the data i.e. the
        # actual measurements.
        df <- rbind(trainX, testX)
        
        ### Course Project: Part 2
        ### "Extracts only the measurements on the mean and standard deviation for each measurement"
                
        # Determine the indices of all columns that contain mean (mean) or 
        # standard deviation (std) attributes
        meanColIndices <- grep("mean()", colnames(df))
        stdColIndices <- grep("std()", colnames(df))
        subsetIndices <- append(meanColIndices, stdColIndices)
        subsetIndices <- sort(subsetIndices)
        
        # Extract, or subset, the columns that were previously identified.
        # The master dataframe will be updated to include just these columns
        df <- df[,subsetIndices]
        
        ### Course Project: Part 3
        ### "Uses descriptive activity names to name the activities in the data set"
        
        # Prepare the columns regarding the subjects i.e. the individuals who
        # were being monitored in this experiment, and their activities i.e. whether
        # they were walking, laying etc.
        subjectColumn <- rbind(trainSubject, testSubject)
        activityColumn <- rbind(trainY, testY)
        
        # Attach the subject and activity columns to the master dataframe, and
        # give descriptive activity names to the various activities.
        df <- cbind(df, subjectColumn, activityColumn)
        df$Activity <- factor(df$Activity, labels = activityLabels[,2])
        
        
        ### Course Project: Part 5
        ### "Create a second, independent tidy data set with the average of 
        ### each variable for each activity and each subject"
        
        # Convert the dataframe into a datatable in order to take advantage of 
        # datatable operations. Use datatable operations to find average of 
        # each variable for each activity and each subject.
        dt <- data.table(df)
        dt <- dt[, lapply(.SD, mean), by = c("Subject", "Activity")]
        
        # Export this tidy dataset into a separate, independent text file.
        # This file will be titled "TidyData.txt"
        write.table(dt, "TidyData.txt", row.name=FALSE)

        "This script is now complete! A tidy dataset has been written to your working directory. Enjoy the tidy data!"
}