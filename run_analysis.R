## This R script makes a tidy data
## Version 0.1 of  2015/08/21
## Human Activity Recognition Using Smartphones Dataset
##
## 

## Reading a training set

print("Loading data Part I ...")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt") 
print("Loaded data Part I ...")     

## Reading a test set
print("Loading data Part II ...")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt") 

print("Loaded data Part II ...")

## Joining a train and test data sets

print("Joining a train and test data sets ...")
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
body_acc_x  <- rbind( body_acc_x_train, body_acc_x_test)
body_acc_y  <- rbind( body_acc_x_train, body_acc_y_test)
body_acc_z  <- rbind( body_acc_x_train, body_acc_z_test) 

body_gyro_x <- rbind(body_gyro_x_train, body_gyro_x_test)
body_gyro_y <- rbind(body_gyro_x_train, body_gyro_y_test)
body_gyro_z <- rbind(body_gyro_x_train, body_gyro_z_test)

total_acc_x <- rbind(total_acc_x_train, total_acc_x_test  )
total_acc_y <- rbind(total_acc_x_train, total_acc_y_test  )
total_acc_z <- rbind(total_acc_x_train, total_acc_z_test  )
print("Joined a train and test data sets ...")



## Reading variables names
print("Readind variable names ...")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")


## Extracts only the measurements on the mean and standard deviation for each measurement. 

print("Extracting mean and standard deviation data ...")
tidy_features_mean_stda <- features[ grepl("mean",features[,2]) | grepl("std",features[,2])  ,]
library(dplyr)
tidy_X <- select(X, tidy_features_mean_stda[,1] )
names(tidy_X) <- tidy_features_mean_stda[,2]

print("Extracted mean and standard deviation data ...")




print("Making a file system ...")

## Making a tidy data filesystem
if(!file.exists("./tidyData_UCI_HAR")){
  dir.create("./tidyData_UCI_HAR")
  dir.create("./tidyData_UCI_HAR/Inertial Signals")
}
print("Made a file system ...")



## Labeling data sets
print("Labeling data sets ...")
ID <- seq(1,nrow(tidy_X))
tidyData_UCI_HAR <- cbind(ID, y, subject, tidy_X)
col_names <- c( "ID", "activityType", "subject", as.character(tidy_features_mean_stda[,2]))
names(tidyData_UCI_HAR) <- col_names
print("Labeled data sets ...")

## Writing  a data sets
print("Writing a data sets ...")
write.table(tidyData_UCI_HAR, file = "./tidyData_UCI_HAR/tidyData_UCI_HAR.txt", row.names = FALSE, col.names = col_names)

write.table(body_acc_x, file = "./tidyData_UCI_HAR/Inertial Signals/body_acc_x.txt ", row.names = FALSE, col.names = FALSE)
write.table(body_acc_y, file = "./tidyData_UCI_HAR/Inertial Signals/body_acc_y.txt ", row.names = FALSE, col.names = FALSE)
write.table(body_acc_z, file = "./tidyData_UCI_HAR/Inertial Signals/body_acc_z.txt ", row.names = FALSE, col.names = FALSE)

write.table(body_gyro_x, file = "./tidyData_UCI_HAR/Inertial Signals/body_gyro_x.txt ", row.names = FALSE, col.names = FALSE)
write.table(body_gyro_y, file = "./tidyData_UCI_HAR/Inertial Signals/body_gyro_y.txt ", row.names = FALSE, col.names = FALSE)
write.table(body_gyro_z, file = "./tidyData_UCI_HAR/Inertial Signals/body_gyro_z.txt ", row.names = FALSE, col.names = FALSE)



write.table(total_acc_x, file = "./tidyData_UCI_HAR/Inertial Signals/total_acc_x.txt ", row.names = FALSE, col.names = FALSE)
write.table(total_acc_y, file = "./tidyData_UCI_HAR/Inertial Signals/total_acc_y.txt ", row.names = FALSE, col.names = FALSE)
write.table(total_acc_z , file = "./tidyData_UCI_HAR/Inertial Signals/total_acc_z.txt ", row.names = FALSE, col.names = FALSE)

print("Wrote a data sets ...")

print ("Well done!")













