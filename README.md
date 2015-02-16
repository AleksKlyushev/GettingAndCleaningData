---
Title: "Getting and Cleaning Data - Course Project"
Author: "Sampath Kumar Padmanaban"
Date: "Monday, February 16, 2015"
---

# Purpose

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

## Dataset description
One of the most exciting areas in all of data science right now is wearable computing. 
For this project data collected from the accelerometers from the Samsung Galaxy S smart phone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data Source
Data for this project is retrieved from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Two data sets are provided. Test and Train data sets. 

## Expected Output
An R script called run_analysis.R should be created. This script should do the following

1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
   
## Steps followed in the R script
   This script assumes that the 'UCI HAR Dataset' is inside the working directory
   
## Step 1
1. Read the raw Column Names from features.txt
2. Clean the columns Names - remove the non alpha numeric characters
3. Pick only mean and standard deviation column names
4. Add the Subject ID and Activity Id to the clean column names

## Step 2
1. Read the activity table from activity_labels.txt
2. Clean the activity name

## Step 3 - Read the training data
1. Read Subject Ids (subject_train.txt)
2. Read Activity Ids (y_train.txt)
3. Read the training data (X_train.txt)
4. Filter only the mean and standard deviation columns from the data set
5. Combine the three files using column bind (subject Ids, activity Ids, training data)
6. Give the clean columns names to the full table

## Step 4 - Read the test data
1. Subject Ids (subject_test.txt)
2. Activity Ids (y_test.txt)
3. Read the test data (X_test.txt)
4. Filter only the mean and standard deviation columns from the data set
5. Combine the three files using column bind (subject Ids, activity Ids, test data)
6. Give the clean columns names to the full table

## Step 5  
Merge the test and train data sets (output of Step 3 and Step 4) using rbind

## Step 6 
Sort the merged data by Subject Id and Activity Id

## Step 7 
Introduce the activity name column by joining with the activity table

## Step 8 
Write the merged data as a txt file "tidy_average_data.txt". (in the current working directory)

## Step 9 
From the merged data set, create the average for each variable by subject/activity

## Step 10 
Write the average calculations as a txt file "tidy_average_data.txt". (in the current working directory)

## End of script