
Course Project for Module 3- Getting and Cleaning Data

The purpose of the project is to test the ability of the student to work with data from given source by extracting, merging, cleaning and labelling and eventually producing a clean set of tidy data serving a given objective.
The output of the project are describe in these four files, namely
1. README.md i.e. this file
2. run_analysis.R
3. CodeBook.md and 
4. the resulting output dataset, tidydata.txt

run_analysis.R
a R script that does the following.
 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set    4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## 1. Merging Training and Test Datasets

### 1.1.Load Training Datasets
   
### 1.2.Load Test Datasets
        
### 1.3.Merging the two datasets , inserting all rows from test after last row of training 
### use rbind()
      
        
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.

### There are 561-feature vector with time and frequency domain
### variables of activities described in the features.txt file

### 2.1.Load file features.txt
   
### 2.2.Select mean and std from the Feature
        
### 2.3.Extract only mean and std from dataset
 
              
## 3.Uses descriptive activity names to name the activities in the data set   

### The datasets contains 6 activities: (WALKING, WALKING_UPSTAIRS,
### WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) as described in 
### activity_labels.txt file

### 3.1.Load file activity_labels.txt
        
### 3.2.Matches the number to the name


## 4.Appropriately labels the data set with descriptive variable names.

### The variable names (i.e. columns) of data sets, by defaults, are V1,V2,...Vn,
### for tidy data, the variable names have to be more meaningful.
        
### 4.1.Labels the datasets        
        
            
## 5.From the data set in step 4, creates a second, 
##   independent tidy data set with the average of each variable 
##   for each activity and each subject.
        
### 5.1.Combine datasets 
### use cbind()
        
        
### 5.2.Create an independent tidy dataset with the above conditions
###     by using dplyr package
   
    5.3. Use write.table() command to output the tidy data   
