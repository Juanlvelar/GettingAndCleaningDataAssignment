# GettingAndCleaningDataAssignment
Coursera Getting And Cleaning Data Peer Graded Assignment

This repository was performed by Juan Luis Velar for Getting and Cleaning Data course project. It has the instructions on how to run analysis.

Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files
CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

run_analysis.R performs the data preparation following 7 steps:
Read the data from the files.
Merges the training and the test sets to create one data set.
Select the mean and std columns
Rename Activities Code by Activities Name
Rename Column Names
From the data set in the previous step, creates an independent data set with the average of each variable for each activity and each subject.