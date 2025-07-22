# Programming-Assignment-Getting-and-Cleaning-Data
 The purpose of this programming assignment is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Data inclueds
'README.txt'
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.


# R script called run_analysis.R does the following steps. 
File with R code "run_analysis.R" perform 5 following steps (in accordance assigned task of course work):

STEP 1 - Merging the training and the test sets to create one data set.
1.1 Read training and test tables
1.2 Read feature and activity labels
1.3 Assign column names 
1.4 Check dimensions and merge data

STEP 2 -  Extracts only the measurements on the mean and standard deviation for each measurement. 
2.1 Locate columns with "-mean()" or "-std()" 
2.2 Subset of data of mean and std for each measurements

STEP 3 - Uses descriptive activity names to name the activities in the data set

STEP 4 - Appropriately labels the data set with descriptive variable names. 

STEP 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.1 Create tidy data set
5.2 Write tidy data set to text file


