==================================================================

Code Book for Processing Raw Human Activity Data into Tidy Data
Uwais Razack, urazack@gmail.com

==================================================================

1.Experimental design and background:

The following is an extract from the UCI Machine Learning Repository.
Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

==================================================================

2. Raw data:

THe following is an extract from the "features_info.txt" file, available at the link below. This extract explains the variables that were measured in this particular experiment, and the subsequent transformations that were applied to attain the raw data.

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

==================================================================

3. Processed data

The script used to process this data is titled "run_analysis.R", and should be available along with this Code Book.

This script extracts, from the raw dataset, all the variables that contain the words "mean" and "std", which stand for the mean value and standard deviation of the respective estimated signals. The script then collates all the extracted data into a master dataframe. This master dataframe is then categorized by the 30 subjects that participated in the experiment, and also by the 6 different activities that each subject did. Finally, this script exports this tidy data as a new dataset, that is ready to be used for further data analysis. More information on how the script achieves the above, can be found in the README file.

Note that the process of preparing tidy data requires that:
1. Each measured variable be in its own column,
2. Each different observation of that variable should be in its own row,
3. Each "kind" of variable should occupy its own table,
4. Should multiple tables exist, there should be a column in each table that allows them to be linked.

The variables that will be found in the new, tidy dataset are explained above. The extracted variables are listed below:

1 "Subject"- Factor variable, with 30 levels (1:30, 1 for each subject)
2 "Activity"- Factor variable, with 6 levels (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING)
3 "tBodyAcc.mean...X"- Numberic variable, normalized and bound within [-1,1]
4 "tBodyAcc.mean...Y"- Numberic variable, normalized and bound within [-1,1]
5 "tBodyAcc.mean...Z"- Numberic variable, normalized and bound within [-1,1]
6 "tBodyAcc.std...X"- Numberic variable, normalized and bound within [-1,1]
7 "tBodyAcc.std...Y"- Numberic variable, normalized and bound within [-1,1]
8 "tBodyAcc.std...Z"- Numberic variable, normalized and bound within [-1,1]
9 "tGravityAcc.mean...X"- Numberic variable, normalized and bound within [-1,1]
10 "tGravityAcc.mean...Y"- Numberic variable, normalized and bound within [-1,1]
11 "tGravityAcc.mean...Z"- Numberic variable, normalized and bound within [-1,1]
12 "tGravityAcc.std...X"- Numberic variable, normalized and bound within [-1,1]
13 "tGravityAcc.std...Y"- Numberic variable, normalized and bound within [-1,1]
14 "tGravityAcc.std...Z"- Numberic variable, normalized and bound within [-1,1]
15 "tBodyAccJerk.mean...X"- Numberic variable, normalized and bound within [-1,1]
16 "tBodyAccJerk.mean...Y"- Numberic variable, normalized and bound within [-1,1]
17 "tBodyAccJerk.mean...Z"- Numberic variable, normalized and bound within [-1,1]
18 "tBodyAccJerk.std...X"- Numberic variable, normalized and bound within [-1,1]
19 "tBodyAccJerk.std...Y"- Numberic variable, normalized and bound within [-1,1]
20 "tBodyAccJerk.std...Z"- Numberic variable, normalized and bound within [-1,1]
21 "tBodyGyro.mean...X"- Numberic variable, normalized and bound within [-1,1]
22 "tBodyGyro.mean...Y"- Numberic variable, normalized and bound within [-1,1]
23 "tBodyGyro.mean...Z"- Numberic variable, normalized and bound within [-1,1]
24 "tBodyGyro.std...X"- Numberic variable, normalized and bound within [-1,1]
25 "tBodyGyro.std...Y"- Numberic variable, normalized and bound within [-1,1]
26 "tBodyGyro.std...Z"- Numberic variable, normalized and bound within [-1,1]
27 "tBodyGyroJerk.mean...X"- Numberic variable, normalized and bound within [-1,1]
28 "tBodyGyroJerk.mean...Y"- Numberic variable, normalized and bound within [-1,1]
29 "tBodyGyroJerk.mean...Z"- Numberic variable, normalized and bound within [-1,1]
30 "tBodyGyroJerk.std...X"- Numberic variable, normalized and bound within [-1,1]
31 "tBodyGyroJerk.std...Y"- Numberic variable, normalized and bound within [-1,1]
32 "tBodyGyroJerk.std...Z"- Numberic variable, normalized and bound within [-1,1]
33 "tBodyAccMag.mean.."- Numberic variable, normalized and bound within [-1,1]
34 "tBodyAccMag.std.."- Numberic variable, normalized and bound within [-1,1]
35 "tGravityAccMag.mean.."- Numberic variable, normalized and bound within [-1,1]
36 "tGravityAccMag.std.."- Numberic variable, normalized and bound within [-1,1]
37 "tBodyAccJerkMag.mean.."- Numberic variable, normalized and bound within [-1,1]
38 "tBodyAccJerkMag.std.."- Numberic variable, normalized and bound within [-1,1]
39 "tBodyGyroMag.mean.."- Numberic variable, normalized and bound within [-1,1]
40 "tBodyGyroMag.std.."- Numberic variable, normalized and bound within [-1,1]
41 "tBodyGyroJerkMag.mean.."- Numberic variable, normalized and bound within [-1,1]
42 "tBodyGyroJerkMag.std.."- Numberic variable, normalized and bound within [-1,1]
43 "fBodyAcc.mean...X"- Numberic variable, normalized and bound within [-1,1]
44 "fBodyAcc.mean...Y"- Numberic variable, normalized and bound within [-1,1]
45 "fBodyAcc.mean...Z"- Numberic variable, normalized and bound within [-1,1]
46 "fBodyAcc.std...X"- Numberic variable, normalized and bound within [-1,1]
47 "fBodyAcc.std...Y"- Numberic variable, normalized and bound within [-1,1]
48 "fBodyAcc.std...Z"- Numberic variable, normalized and bound within [-1,1]
49 "fBodyAcc.meanFreq...X"- Numberic variable, normalized and bound within [-1,1]
50 "fBodyAcc.meanFreq...Y"- Numberic variable, normalized and bound within [-1,1]
51 "fBodyAcc.meanFreq...Z"- Numberic variable, normalized and bound within [-1,1]
52 "fBodyAccJerk.mean...X"- Numberic variable, normalized and bound within [-1,1]
53 "fBodyAccJerk.mean...Y"- Numberic variable, normalized and bound within [-1,1]
54 "fBodyAccJerk.mean...Z"- Numberic variable, normalized and bound within [-1,1]
55 "fBodyAccJerk.std...X"- Numberic variable, normalized and bound within [-1,1]
56 "fBodyAccJerk.std...Y"- Numberic variable, normalized and bound within [-1,1]
57 "fBodyAccJerk.std...Z"- Numberic variable, normalized and bound within [-1,1]
58 "fBodyAccJerk.meanFreq...X"- Numberic variable, normalized and bound within [-1,1]
59 "fBodyAccJerk.meanFreq...Y"- Numberic variable, normalized and bound within [-1,1]
60 "fBodyAccJerk.meanFreq...Z"- Numberic variable, normalized and bound within [-1,1]
61 "fBodyGyro.mean...X"- Numberic variable, normalized and bound within [-1,1]
62 "fBodyGyro.mean...Y"- Numberic variable, normalized and bound within [-1,1]
63 "fBodyGyro.mean...Z"- Numberic variable, normalized and bound within [-1,1]
64 "fBodyGyro.std...X"- Numberic variable, normalized and bound within [-1,1]
65 "fBodyGyro.std...Y"- Numberic variable, normalized and bound within [-1,1]
66 "fBodyGyro.std...Z"- Numberic variable, normalized and bound within [-1,1]
67 "fBodyGyro.meanFreq...X"- Numberic variable, normalized and bound within [-1,1]
68 "fBodyGyro.meanFreq...Y"- Numberic variable, normalized and bound within [-1,1]
69 "fBodyGyro.meanFreq...Z"- Numberic variable, normalized and bound within [-1,1]
70 "fBodyAccMag.mean.."- Numberic variable, normalized and bound within [-1,1]
71 "fBodyAccMag.std.."- Numberic variable, normalized and bound within [-1,1]
72 "fBodyAccMag.meanFreq.."- Numberic variable, normalized and bound within [-1,1]
73 "fBodyBodyAccJerkMag.mean.."- Numberic variable, normalized and bound within [-1,1]
74 "fBodyBodyAccJerkMag.std.."- Numberic variable, normalized and bound within [-1,1]
75 "fBodyBodyAccJerkMag.meanFreq.."- Numberic variable, normalized and bound within [-1,1]
76 "fBodyBodyGyroMag.mean.."- Numberic variable, normalized and bound within [-1,1]
77 "fBodyBodyGyroMag.std.."- Numberic variable, normalized and bound within [-1,1]
78 "fBodyBodyGyroMag.meanFreq.."- Numberic variable, normalized and bound within [-1,1]
79 "fBodyBodyGyroJerkMag.mean.."- Numberic variable, normalized and bound within [-1,1]
80 "fBodyBodyGyroJerkMag.std.."- Numberic variable, normalized and bound within [-1,1]
81 "fBodyBodyGyroJerkMag.meanFreq.."- Numberic variable, normalized and bound within [-1,1]

