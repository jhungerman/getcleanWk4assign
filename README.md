# Getting and Cleaning Data - Wk 4 Course Project

The purpose of this project is to merge various data sets compiled into a zip folder from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file was downloaded & extracted manually, rather than scripted.

## Key Files

1. README.md - A description of the project
2. CODEBOOK.md - A decription of the variables and data
3. run_analysis.R - A file created in SublimeText which contains the necessary code
4. wk4assign_tidy - A .txt file which is the resulting data set from running the code in file 3

## Stated Project Tasks

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Code Procedure

The individual code listed in run_analysis.R is commented with short descriptions to explain the procedure

The result of run_analysis.R is a .txt file where the mean and standard deviation variables are grouped and averaged by subject (first) and activity (second)

The resulting file is listed above in Key Files [4]