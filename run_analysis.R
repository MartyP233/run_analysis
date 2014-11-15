#This code will work if the samsung data is stored in your working
# directory, in the folder UCI HAR Dataset.

# *Caution* this syntax contains code to clear the workspace except for the
# main dataset, i.e. this will clear your workspace if you run it.

# Step 1 Read in the test feature data, activity data and subject data
testfeaturedata <- read.table('UCI HAR Dataset/test/x_test.txt')
testactivitydata <- read.table('UCI HAR Dataset/test/y_test.txt')
testsubjectdata <- read.table('UCI HAR Dataset/test/subject_test.txt')

# Step 2 Read in the train feature data, activity data and subject data
trainfeaturedata <- read.table('UCI HAR Dataset/train/x_train.txt')
trainactivitydata <- read.table('UCI HAR Dataset/train/y_train.txt')
trainsubjectdata <- read.table('UCI HAR Dataset/train/subject_train.txt')

# Step 3 Read in the feature label data
featurelabels <- read.table('UCI HAR Dataset/features.txt')

# Step 4 Appropriately label the feature datasets with descriptive variable names
names(testfeaturedata) <- featurelabels$V2
names(trainfeaturedata) <- featurelabels$V2

# Step 5 Appropriate name the activity & subject variable in the test & train
# activity and subject datasets
names(testactivitydata)[1] <- 'activity'
names(trainactivitydata)[1] <- 'activity'
names(testsubjectdata)[1] <- 'subject'
names(trainsubjectdata)[1] <- 'subject'

# Step 6 Merge the activity data with the feature data for test & train
testdata <- cbind(testfeaturedata,testactivitydata, testsubjectdata)
traindata <- cbind(trainfeaturedata,trainactivitydata, trainsubjectdata)

# Step 7 Merge the test & train data together
alldata <- rbind(testdata, traindata)

# Step 8 Remove the precursor  datasets to clear up the workspace
rm(list=setdiff(ls(), "alldata"))

# Step 9 Extract only the measurements on the mean and standard deviation  
##for each measurement and keep the activity & subject data

alldata <- alldata[ , grepl( "mean|std|activity|subject", names(alldata))]

#Step 10 Read in the activity labels data and use descriptive activity names 
#to name the activities in the data set
activitylabels <- read.table('UCI HAR Dataset/activity_labels.txt')

alldata$activity <- factor(alldata$activity,
                            levels = activitylabels$V1,
                            labels = activitylabels$V2)
rm(activitylabels)

## Step 11 From the dataset in step 10, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject
library(dplyr)

meandataset <- alldata %>%
                 group_by(activity, subject) %>%
                 summarise_each(funs(mean))

