# Get_data_course_project
This is for the coursera course "Getting and Cleaning Data" course project

The original dataset is from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The objective of this project is to summarize data from wearble devices and turn it ino more clean form.

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


You can read the tidy data file back into R by read.table(header=TRUE) 
