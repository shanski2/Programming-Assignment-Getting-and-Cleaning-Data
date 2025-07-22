#Getting and Cleaning Data Course Project

#Purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis.

####################################################################################
# Step 1: Merge the training and the test sets to create one data set.
####################################################################################
# 1.1 Read training and test tables
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt") 
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
 
# 1.2 Read feature and activity labels
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_lazbels.txt")

# 1.3 Assign column names 

colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]

colnames(y_train) <- "activity_id"
colnames(y_test) <- "activity_id"

colnames(subject_train) <- "subject_id"
colnames(subject_test) <- "subject_id"

colnames(activity_labels) <- c("activity_id","activity_type")

# 1.4 Check dimensions and merge data
dim(x_train) ##7352  561
dim(y_train) ##7352    1
dim(x_test)  ##2947  561
dim(y_test)  ##2947    1
dim(subject_train) ##7352    1
dim(subject_test)  ##2947    1

train_data  <- cbind(x_train, y_train,subject_train, data = "train")
test_data  <- cbind(x_test, y_test,subject_test, data = "test")
dim(train_data) ##7352  564
dim(test_data)   ##2947  564

combined_data <- rbind(train_data,test_data) 
dim(combined_data)

####################################################################################
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
####################################################################################
# 2.1 Locate columns with "-mean()" or "-std()" 
mean_std_index <- grep("mean..|std..|activity_id|subject_id", colnames(combined_data))

# 2.2 Subset of data of mean and std for each measurements
subset_data <- combined_data[,mean_std_index]

####################################################################################
# Step 3: Uses descriptive activity names to name the activities in the data set
####################################################################################
# 3.1 
subset_data_new <- merge(subset_data, activity_labels, by='activity_id')

####################################################################################
# Step 4: Appropriately label the data set with descriptive variable names. 
####################################################################################
names(subset_data_new)<-gsub("Acc", "Accelerometer", names(subset_data_new))
names(subset_data_new)<-gsub("Gyro", "Gyroscope", names(subset_data_new))
names(subset_data_new)<-gsub("BodyBody", "Body", names(subset_data_new))
names(subset_data_new)<-gsub("Mag", "Magnitude", names(subset_data_new))
names(subset_data_new)<-gsub("^t", "Time", names(subset_data_new))
names(subset_data_new)<-gsub("^f", "Frequency", names(subset_data_new))
names(subset_data_new)<-gsub("tBody", "TimeBody", names(subset_data_new))
names(subset_data_new)<-gsub("-[Mm]ean()", "Mean", names(subset_data_new), ignore.case = TRUE)
names(subset_data_new)<-gsub("-std()", "STD", names(subset_data_new), ignore.case = TRUE)
names(subset_data_new)<-gsub("-freq()", "Frequency", names(subset_data_new), ignore.case = TRUE)
names(subset_data_new)<-gsub("angle", "Angle", names(subset_data_new))
names(subset_data_new)<-gsub("gravity", "Gravity", names(subset_data_new))

####################################################################################
# Step 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
####################################################################################
# 5.1 Create tidy data set
library(dplyr)

Tidydata <- subset_data_new %>%
  group_by(subject_id, activity_id) %>%
  summarise_all(.,mean)

# 5.2 Write tidy data set to text file
write.table(Tidydata, "Tidydata.txt", row.name=FALSE)