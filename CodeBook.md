The run_analysis.R script performs the data preparation following the steps 
required in the course project’s definition.

Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

Assign the data to variables
features <- eatures.txt"
activities <- activity_labels.txt
subject_test <- subject_test.txt
x_test <- X_test.txt
y_test <- y_test.txt
subject_train <- subject_train.txt
x_train <- X_train.txt
y_train <- y_train.txt

Merges the training and the test sets to create one data set
xrows was created with rbind merging x_test and x_train
yrows was created with rbind merging y_test and y_train 
subject was created with rbind merging subject_test and subject_train
dataset was created with cbind merging previous variables

Extracts only the measurements on the mean and standard deviation for each 
measurement was created by subsetting Merged_Data, selecting only columns: 
subject, code and the measurements on the mean and standard deviation (std) 
for each measurement

The activity names replace the activities code in the data set with activities 
variable

Column labels were properly changed.
Acc in column’s name replaced by Accelerometer
Gyro in column’s name replaced by Gyroscope
BodyBody in column’s name replaced by Body
Mag in column’s name replaced by Magnitude
f in column’s name replaced by Frequency
t in column’s name replaced by Time

From the previous data set an independent data set with the average of each variable for each activity and each subject
