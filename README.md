---
title: "Instruction of how the code works and coodbook for course project of \"getting and cleaning data\""
author: "Wei"
date: "April 24, 2015"
output: html_document
---
## What is this data?
This data records human activities using smartphone.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## How to process raw data
- Step 0: Before running the code, please make sure you properly set up your working directory.
- Step 1: Merges the training and the test sets to create one data set. Use "rbind()" to combine train and test datasets. The combined data set "all" has 10299 rows and 561 columns. 
- Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. Use "grep()" to get variable labels only contains keyword "mean" and "std".
- Step 3: Uses descriptive activity names to name the activities in the data set. Activity names are stored in "activity_labels.txt".
- Step 4: Appropriately labels the data set with descriptive variable names. All descriptive variable names are stored in "features.txt".
- Step 5: creates an independent tidy data set "result"" with the average of each variable for each activity and each subject. Use "aggregate()" to calculate means for each activity and each subject combination.

## Coodbook
The final tidy dataset contains 68 columns and 180 rows. Each row represent a unique subject and activity combination.

- Column 1 is the activity type (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), categorical variable;
- Column 2 is the subject identifier (1-30), int variable;
- Column 3-68 are the measurements obtained from smartphone, including means and standard deviations of the signals. Detailed information can be found at "feature_info.txt".
