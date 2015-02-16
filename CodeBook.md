---
Title: "Getting and Cleaning Data - Course Project"
Author: "Sampath Kumar Padmanaban"
Date: "Monday, February 16, 2015"
---

## Purpose

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

## Dataset description
One of the most exciting areas in all of data science right now is wearable computing. 
For this project data collected from the accelerometers from the Samsung Galaxy S smart phone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities 

- WALKING, 
- WALKING UPSTAIRS, 
- WALKING DOWNSTAIRS, 
- SITTING, 
- STANDING, 
- LAYING

wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data Source
Data for this project is retrieved from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Two data sets are provided. Test and Train data sets. 

## Output
This project produces two text files.

- tidy_data.txt - This is the cleaned up data after merging the test and train data sets
- tidy_average_data.txt - This is the file with the average of all measurement values for each subject/activity

Please read the README.md for the steps followed in generating these files.
(https://github.com/janasampath/GettingAndCleaningData/blob/master/README.md)

Both the files have the same number and sequence of columns.
They are as follows:

1.	subject.id
2.	activity.id
3.	activity.name
4.	tBodyAcc.mean.X
5.	tBodyAcc.mean.Y
6.	tBodyAcc.mean.Z
7.	tBodyAcc.std.X
8.	tBodyAcc.std.Y
9.	tBodyAcc.std.Z
10.	tGravityAcc.mean.X
11.	tGravityAcc.mean.Y
12.	tGravityAcc.mean.Z
13.	tGravityAcc.std.X
14.	tGravityAcc.std.Y
15.	tGravityAcc.std.Z
16.	tBodyAccJerk.mean.X
17.	tBodyAccJerk.mean.Y
18.	tBodyAccJerk.mean.Z
19.	tBodyAccJerk.std.X
20.	tBodyAccJerk.std.Y
21.	tBodyAccJerk.std.Z
22.	tBodyGyro.mean.X
23.	tBodyGyro.mean.Y
24.	tBodyGyro.mean.Z
25.	tBodyGyro.std.X
26.	tBodyGyro.std.Y
27.	tBodyGyro.std.Z
28.	tBodyGyroJerk.mean.X
29.	tBodyGyroJerk.mean.Y
30.	tBodyGyroJerk.mean.Z
31.	tBodyGyroJerk.std.X
32.	tBodyGyroJerk.std.Y
33.	tBodyGyroJerk.std.Z
34.	tBodyAccMag.mean
35.	tBodyAccMag.std
36.	tGravityAccMag.mean
37.	tGravityAccMag.std
38.	tBodyAccJerkMag.mean
39.	tBodyAccJerkMag.std
40.	tBodyGyroMag.mean
41.	tBodyGyroMag.std
42.	tBodyGyroJerkMag.mean
43.	tBodyGyroJerkMag.std
44.	fBodyAcc.mean.X
45.	fBodyAcc.mean.Y
46.	fBodyAcc.mean.Z
47.	fBodyAcc.std.X
48.	fBodyAcc.std.Y
49.	fBodyAcc.std.Z
50.	fBodyAccJerk.mean.X
51.	fBodyAccJerk.mean.Y
52.	fBodyAccJerk.mean.Z
53.	fBodyAccJerk.std.X
54.	fBodyAccJerk.std.Y
55.	fBodyAccJerk.std.Z
56.	fBodyGyro.mean.X
57.	fBodyGyro.mean.Y
58.	fBodyGyro.mean.Z
59.	fBodyGyro.std.X
60.	fBodyGyro.std.Y
61.	fBodyGyro.std.Z
62.	fBodyAccMag.mean
63.	fBodyAccMag.std
64.	fBodyBodyAccJerkMag.mean
65.	fBodyBodyAccJerkMag.std
66.	fBodyBodyGyroMag.mean
67.	fBodyBodyGyroMag.std
68.	fBodyBodyGyroJerkMag.mean
69.	fBodyBodyGyroJerkMag.std

- The measurement variables from column 4 to column 69 are numeric type. The meaning of each of these mesurement columns is explained in the orginal source 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 