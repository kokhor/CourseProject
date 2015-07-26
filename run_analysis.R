##create one R script called run_analysis.R that does the following. 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## 1. Merging Training and Test Datasets

### 1.1.Load Training Datasets
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

### 1.2.Load Test Datasets
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

### 1.3.Merging the two datasets , inserting all rows from test after last row of training 
### use rbind()
        x <- rbind(x_train, x_test)
        y <- rbind(y_train, y_test)
        subject <- rbind(subject_train, subject_test)


        
        
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.

### There are 561-feature vector with time and frequency domain
### variables of activities described in the features.txt file

### 2.1.Load file features.txt
        Feature <- read.table("UCI HAR Dataset/features.txt")

### 2.2.Select mean and std from the Feature

        MeanStd <- Feature[grep("mean()|std()", Feature$V2),]
        
### 2.3.Extract only mean and std from dataset x
    
        MeanStdData <- x[, MeanStd$V1]
        
        
## 3.Uses descriptive activity names to name the activities in the data set   

### The datasets contains 6 activities: (WALKING, WALKING_UPSTAIRS,
### WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) as described in 
### activity_labels.txt file

### 3.1.Load file activity_labels.txt
        
        ActivityLabel <- read.table("UCI HAR Dataset/activity_labels.txt")

### 3.2.Matches the number to the name

        ActivityData <- ActivityLabel[ y[,1], 2]
        ActivityData <- as.data.frame(ActivityData)

## 4.Appropriately labels the data set with descriptive variable names.

### The variable names (i.e. columns) of data sets, by defaults, are V1,V2,...Vn,
### for tidy data, the variable names have to be more meaningful.
### In this case, MeanStd can be used to rename columns names of data set MeanStdData.
        
### 4.1.Labels the data set MeanStdData 

        names(MeanStdData) <- MeanStd$V2
        
### 4.2.Labels the data set ActivityData
       
        names(ActivityData) <- "Activities"
         
### 4.3.Labels the data set subject
         
        names(subject) <- "Subjects"


## 5.From the data set in step 4, creates a second, 
##   independent tidy data set with the average of each variable 
##   for each activity and each subject.
        
### 5.1.Combine datasets of MeanStdData, ActivityData and subject 
### use cbind()
        
        Alldata <- cbind(MeanStdData,ActivityData,subject)   
        
### 5.2.Create an independent tidy dataset with the above conditions
###     by using dplyr package
   
        library(dplyr)
        groupbydata <- group_by(Alldata, Subjects, Activities)
        tidydata <- summarise_each(groupbydata, funs(mean))
        

      
     
    
   