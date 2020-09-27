# Getting-and-Cleaning-Data-Course-Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.
More information can be found at the data source website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This repository contains the following files:

README.md, this file, which provides an overview of the data set and how it was created. tidy_data.txt, which contains the data set. CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data). run_analysis.R, the R script that was used to create the data set.
The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set.

# The code was written based on the instruction of this assignment
Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
