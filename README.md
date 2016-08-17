Getting and Cleaning Data Course Project
===

### Author: David Paolella (https://github.com/dpaolella/Getting-Cleaning-Data-Course-Project)

Project Background and Data Description
---

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

> Here are the data for the project:

> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

> You should create one R script called run_analysis.R that does the following.

> 1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Description of R Code
---

#### Name of Code: run_analysis.R

#### Input Datafiles
1. features.txt
2. activity_labels.txt
3. X_test.txt
4. y_test.txt
5. subject_test.txt
6. X_train.txt
7. y_train.txt
8. subject_train.txt

#### Required packages
1. dplyr
2. tidyr
3. stringr

#### Steps
1. Import packages.
2. Set working directory containing necessary datafiles.
3. Import data.
4. Stack test and train data.
5. Define column names using the features data set.
6. Attach activity names to activity labels.
7. Keep only the columns mean and standard deviation for each measurement.
8. Create a tidy data set with the average of each variable for each activity and each subject.
9. Write tidy data set to tab-delimited file.





