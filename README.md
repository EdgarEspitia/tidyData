
#Getting And Cleaning Data
#Course project

This repo contains Course project "Making a tidy data set"


## Preparations

Downloads the zip file  "UCI HAR Dataset.zip". It contains the next files:
	
	./UCI HAR Dataset/activity_labels.txt
			features.txt	
			features_info.txt
			README.txt
	
	./UCI HAR Dataset/train/subject_train.txt
				X_train.txt
				y_train.txt
	./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt
						body_acc_y_train.txt
						body_acc_z_train.txt
						body_gyro_x_train.txt
						body_gyro_x_train.txt
						body_gyro_y_train.txt
						body_gyro_z_train.txt
						total_acc_x_train.txt
						total_acc_y_train.txt
						total_acc_z_train.txt

	./UCI HAR Dataset/test/subject_test.txt
				X_test.txt
				y_test.txt
	./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt
						body_acc_y_test.txt
						body_acc_z_test.txt
						body_gyro_x_test.txt
						body_gyro_x_test.txt
						body_gyro_y_test.txt
						body_gyro_z_test.txt
						total_acc_x_test.txt
						total_acc_y_test.txt
						total_acc_z_test.txt
## Runing the script

we must only run the script "run_analysis.R"




## Testing the tiny data set

We can check the tidy data with the command head, it looks like:

>head(tidyData_UCI_HAR)	
ID activityType subject tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z   ...
1  1            5       1         0.2885845       -0.02029417        -0.1329051
2  2            5       1         0.2784188       -0.01641057        -0.1235202
3  3            5       1         0.2796531       -0.01946716        -0.1134617
4  4            5       1         0.2791739       -0.02620065        -0.1232826
5  5            5       1         0.2766288       -0.01656965        -0.1153619
6  6            5       1         0.2771988       -0.01009785        -0.1051373


 
