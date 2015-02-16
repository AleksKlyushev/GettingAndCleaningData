# The object of this script is to 
# 1. Read the following files from Train set
#     subject_train.txt
#     y_train.txt
#     X_train.txt
# 2. Combine these three files in the same order and create the train data file.
# 3. Repeat the same for the Test data set and create the combined test data file.
# 4. Read the featrures.txt file (These are the column names)
# 5. Merge the two files and create a single data file 
# 6. Add the column names for Subject Id, Activity Id, and the rest of the columns (from features.txt)
# 7. In addition to the Subject ID, Activity ID columns extract only the mean and STd Deviation columns
# 8. Create a new data file with these columns. (from Step 7)
# 9. Find the average for each variable grouped by Subject ID and Activity ID

####### This script assumes that the 'UCI HAR Dataset' is inside the working directory ######

## Install the required packages
if (!require('dplyr')) {
  library('dplyr')
}

## Read the Raw Column Names
raw.column.names <- read.csv("./UCI HAR Dataset/features.txt", sep=" ", header=FALSE,  stringsAsFactors = FALSE)[,2]

## Clean the columns Names
clean.column.names <- gsub("[-,]", '\\.', raw.column.names)
clean.column.names <- gsub("[()]", '', clean.column.names)

## Pick only mean and Std Dev columns
columns.to.be.included <- grep(".+[.]((mean)|(std))(([.]+)|$)?", tolower(clean.column.names))
clean.column.names <- clean.column.names[columns.to.be.included]
## Add the Subject ID and Activity Id to the clean column names
clean.column.names <- c(c("subject.id","activity.id"), clean.column.names)

## Read the activity table
activity.table <-  read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activity.id","activity.name"))
## Clean the activity name
activity.table$activity.name <- gsub("[_,]", '\\.', tolower(activity.table$activity.name))

## Read the training data
## 1. Subject Ids
subject.id.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## 2. Activity Ids
activity.id.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
## 3. Read the training data
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")
## 4. Filter only the mean and std dev columns from the data set
train.data <- train.data[,columns.to.be.included]
## 5. Combine the three files using column bind
train.data.combined <- cbind(subject.id.train, activity.id.train, train.data)
## 6. Give the clean columns names to the full table
names(train.data.combined) <- clean.column.names


## Read the Test Data
## 1. Subject Ids
subject.id.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## 2. Activity Ids
activity.id.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
## 3. Read the training data
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt")
## 4. Filter only the mean and std dev columns from the data set
test.data <- test.data[,columns.to.be.included]
## 5. Combine the three files using column bind
test.data.combined <- cbind(subject.id.test, activity.id.test, test.data)
## 6. Give the clean columns names to the full table
names(test.data.combined) <- clean.column.names

## Merge the test and train data sets
merged.data <- rbind(train.data.combined, test.data.combined)

## Sort the merged data by Subject Id and Activity Id
merged.data <- arrange(merged.data, subject.id,activity.id)

## Introduce the activity name column by joining with the activity table
merged.data <- left_join(merged.data, activity.table, by = "activity.id", match = "first")
merged.data <- merged.data[,c(1,2,69,3:68)]

## Write the merged data as a txt file. (in the current working directory)
write.table(merged.data, file = "tidy_data.txt", row.names = FALSE)

## From the merged data set, create the average for each variable by subject/activity
average.data <- merged.data %>%
  melt(id.vars = c("subject.id", "activity.name")) %>%
  group_by(subject.id, activity.name, variable) %>%
  dcast(subject.id + activity.name ~ variable, mean)

## Rearrange the columns and sort the data 
average.data <- average.data[,c(1,3,2,4:69)]
average.data <- arrange(average.data, subject.id,activity.id)

## Write the average calculations as a txt file. (in the current working directory)
write.table(average.data, file = "tidy_average_data.txt", row.names = FALSE)

## End of script