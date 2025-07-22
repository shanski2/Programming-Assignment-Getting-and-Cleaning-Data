# Project Code Book

This code book provides information on how to access the source data, execute the R script, and understand the variables and transformations applied in the process.

## How to Access the Data:

1. **Download Data:**
   - Download the source data from the following link: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
   - Unzip the downloaded file into the working directory of R Studio.

2. **Execute R Script:**
   - Run the R script named "run_analysis.R" to perform the necessary operations on the data.

## Source Data:

The source data for this project originates from the Human Activity Recognition Using Smartphones Data Set. 
A comprehensive description of the dataset can be found at (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
Direct link to the data: [UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## R Script:
The R script, "run_analysis.R," performs the following steps (in accordance assigned task of course work):

STEP 1 - Merging the training and the test sets to create one data set. 
1.1 Read training and test tables 
1.2 Read feature and activity labels 
1.3 Assign column names 
1.4 Check dimensions and merge data

STEP 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
2.1 Locate columns with "-mean()" or "-std()" 
2.2 Subset of data of mean and std for each measurements

STEP 3 - Uses descriptive activity names to name the activities in the data set

STEP 4 - Appropriately labels the data set with descriptive variable names.

STEP 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
5.1 Create tidy data set 
5.2 Write tidy data set to text file

**Note:** The code assumes that all data files are present in the same folder, uncompressed, and with their original names intact.

## Variables:
- `x_train`, `y_train`, `x_test`, `y_test`, `subject_train`, and `subject_test` contain data from the downloaded files.
- `x_data`, `y_data`, and `subject_data` merge the above datasets for further analysis.
- `features` contains the correct names for the `x_data` dataset, applied to the column names for detailed reference.
