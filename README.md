==================================================================

Processing Raw Human Activity Data into Tidy Data
Uwais Razack, urazack@gmail.com

==================================================================

This README file provides additional information about the run_analysis.R script.

==================================================================

1. What does the script do in a nutshell

The run_analysis.R script takes raw human activity data, from the UCI Machine Learning Repository and processes that data into a tidy dataset, that is then ready to be used in further data analysis.

The data in this analysis can be sourced from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Tidy data requires that:
1. Each measured variable be in its own column,
2. Each different observation of that variable should be in its own row,
3. Each "kind" of variable should occupy its own table,
4. Should multiple tables exist, there should be a column in each table that allows them to be linked.

==================================================================

2. run_analysis.R step-by-step

This section will list the steps of the script:

1.      Upon running the script in R, the data.table package is loaded into the workspace
2*.     This step is optional. By default, the script assumes that you have already downloaded the data, and unzipped it into your working directory. If you have not done this, and you'd like the script to do this for you, you can remove the hashtags (#) in the margins of the Get Data section (lines 20-21).
3.      All the required datasets are read into R. There are 8 files that will be read, namely:
        UCI HAR Dataset/test/X_test.txt
        UCI HAR Dataset/test/subject_test.txt
        UCI HAR Dataset/test/y_test.txt
        UCI HAR Dataset/train/X_train.txt
        UCI HAR Dataset/train/subject_train.txt
        UCI HAR Dataset/train/y_train.txt
        UCI HAR Dataset/features.txt
        UCI HAR Dataset/activity_labels.txt
4.      Each variable in these datasets are then given headers.
5.      A master dataframe is created by combining the X_test.txt and X_train.txt datasets
6.      From the master dataframe, the script then extracts only the variable i.e. columns that contain mean and standard deviation measurements. This is done by using the grep() function to search through the variable names for "mean" and "std", and then produce a vector of indices of the required columns. This vector is then used to subset out the required columns.
7.      The script then prepares the two columns that will later be used to categorize the dataset. The Subject column is created by combining, with an rbind(), subject_test.txt and subject_train.txt. Similarly, the Activity column is created by combining y_test.txt and y_train.txt. The Subject and Activity columns are then combined to the master dataframe using a cbind(). The Subject column contains the mapping ID's of the 30 subjects that were tracked in this experiment, while the Activity column contains the mapping ID's of all the activities that each subject was doing.
8.      The Activity column, which now has values of 1:6 for each of the 6 activities, is then replaced with more descriptive names. These names are sourced from the activity_labels.txt dataset. These names are mapped to the Activity column by transforming the Activity column to a factor column, and then mapping the activity labels to each factor level. This concludes the bulk of the data tidying part of the process.
9.      The final step is to create an independent dataset with the average of each variable for each activity and each subject. This script accomplishes this by first converting the tidy master dataframe into a datatable. Datatables allow plyr-like operations, which make it simple to do the final manipulation required. Using a datatable operation the scrip then collapses all the measured variables into their means, categorized by each unique subject and activity combination.
10.     Finally, this datatable is then written to a new, independent dataset titled "TidyData.txt"

==================================================================

3. Reading in the new, tidy dataset

If you would like to analyse the new, tidy dataset, then you can read the dataset in with the read.table() function. If the file "TidyData.txt" is in the working directory, you can use the following code to read it into a variable called "tidydata" in R:
tidydata <- read.table("TidyData.txt", header = T)


















