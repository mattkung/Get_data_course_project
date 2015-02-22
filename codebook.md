The original dataset is from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Using run_analysis.r, I clean some data and do below transformation.
(I Change some steps, but the result is the same, please bear with it.)

1. Merges the training and the test sets to create one data set.
- bind test/train to their subects and activities
- bind test and train together

3. Uses descriptive activity names to name the activities in the data set
- the original dataset only note the activity type by integer, I use merge method to change it to descriptive activity name, like walking.
- Remove the duplicated column from the merge


4. Appropriately labels the data set with descriptive variable names. 
- using feature.txt to lable variable names

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- the tidy data only need measurements about mean and standard deviation, using grep to find mean and std


5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- since the original dataset has duplicated column, I delete them first.
- using dplyr's group_by and summarise_each to compute mean by every  subject and every activity

Following are variable description, they are described by "variable name","variable type","unit"


"variable name" "variable type" "unit"
"1" subject integer people
"2" activity factor activity type
"3" tBodyAcc-mean()-X numeric null
"4" tBodyAcc-mean()-Y numeric null
"5" tBodyAcc-mean()-Z numeric null
"6" tBodyAcc-std()-X numeric null
"7" tBodyAcc-std()-Y numeric null
"8" tBodyAcc-std()-Z numeric null
"9" tGravityAcc-mean()-X numeric null
"10" tGravityAcc-mean()-Y numeric null
"11" tGravityAcc-mean()-Z numeric null
"12" tGravityAcc-std()-X numeric null
"13" tGravityAcc-std()-Y numeric null
"14" tGravityAcc-std()-Z numeric null
"15" tBodyAccJerk-mean()-X numeric null
"16" tBodyAccJerk-mean()-Y numeric null
"17" tBodyAccJerk-mean()-Z numeric null
"18" tBodyAccJerk-std()-X numeric null
"19" tBodyAccJerk-std()-Y numeric null
"20" tBodyAccJerk-std()-Z numeric null
"21" tBodyGyro-mean()-X numeric null
"22" tBodyGyro-mean()-Y numeric null
"23" tBodyGyro-mean()-Z numeric null
"24" tBodyGyro-std()-X numeric null
"25" tBodyGyro-std()-Y numeric null
"26" tBodyGyro-std()-Z numeric null
"27" tBodyGyroJerk-mean()-X numeric null
"28" tBodyGyroJerk-mean()-Y numeric null
"29" tBodyGyroJerk-mean()-Z numeric null
"30" tBodyGyroJerk-std()-X numeric null
"31" tBodyGyroJerk-std()-Y numeric null
"32" tBodyGyroJerk-std()-Z numeric null
"33" tBodyAccMag-mean() numeric null
"34" tBodyAccMag-std() numeric null
"35" tGravityAccMag-mean() numeric null
"36" tGravityAccMag-std() numeric null
"37" tBodyAccJerkMag-mean() numeric null
"38" tBodyAccJerkMag-std() numeric null
"39" tBodyGyroMag-mean() numeric null
"40" tBodyGyroMag-std() numeric null
"41" tBodyGyroJerkMag-mean() numeric null
"42" tBodyGyroJerkMag-std() numeric null
"43" fBodyAcc-mean()-X numeric null
"44" fBodyAcc-mean()-Y numeric null
"45" fBodyAcc-mean()-Z numeric null
"46" fBodyAcc-std()-X numeric null
"47" fBodyAcc-std()-Y numeric null
"48" fBodyAcc-std()-Z numeric null
"49" fBodyAcc-meanFreq()-X numeric null
"50" fBodyAcc-meanFreq()-Y numeric null
"51" fBodyAcc-meanFreq()-Z numeric null
"52" fBodyAccJerk-mean()-X numeric null
"53" fBodyAccJerk-mean()-Y numeric null
"54" fBodyAccJerk-mean()-Z numeric null
"55" fBodyAccJerk-std()-X numeric null
"56" fBodyAccJerk-std()-Y numeric null
"57" fBodyAccJerk-std()-Z numeric null
"58" fBodyAccJerk-meanFreq()-X numeric null
"59" fBodyAccJerk-meanFreq()-Y numeric null
"60" fBodyAccJerk-meanFreq()-Z numeric null
"61" fBodyGyro-mean()-X numeric null
"62" fBodyGyro-mean()-Y numeric null
"63" fBodyGyro-mean()-Z numeric null
"64" fBodyGyro-std()-X numeric null
"65" fBodyGyro-std()-Y numeric null
"66" fBodyGyro-std()-Z numeric null
"67" fBodyGyro-meanFreq()-X numeric null
"68" fBodyGyro-meanFreq()-Y numeric null
"69" fBodyGyro-meanFreq()-Z numeric null
"70" fBodyAccMag-mean() numeric null
"71" fBodyAccMag-std() numeric null
"72" fBodyAccMag-meanFreq() numeric null
"73" fBodyBodyAccJerkMag-mean() numeric null
"74" fBodyBodyAccJerkMag-std() numeric null
"75" fBodyBodyAccJerkMag-meanFreq() numeric null
"76" fBodyBodyGyroMag-mean() numeric null
"77" fBodyBodyGyroMag-std() numeric null
"78" fBodyBodyGyroMag-meanFreq() numeric null
"79" fBodyBodyGyroJerkMag-mean() numeric null
"80" fBodyBodyGyroJerkMag-std() numeric null
"81" fBodyBodyGyroJerkMag-meanFreq() numeric null
