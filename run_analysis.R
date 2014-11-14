
# Read in the testdata and labels
testdata <- read.table('UCI HAR Dataset/test/x_test.txt')
featurelabels <- read.table('UCI HAR Dataset/features.txt')
testdataactivity <- read.table('UCI HAR Dataset/test/y_test.txt')

# Read in the traindata and labels
traindata <- read.table('UCI HAR Dataset/train/x_train.txt')
traindataactivity <- read.table('UCI HAR Dataset/train/y_train.txt')

##Appropriately labels the data sets with descriptive variable names
names(testdata) <- featurelabels$V2
names(traindata) <- featurelabels$V2

#label the activity column
names(testdataactivity)[1] <- 'activity'
names(traindataactivity)[1] <- 'activity'

# Merge the activity and test/train data together

testdata2 <- cbind(testdata,testdataactivity)
traindata2 <- cbind(traindata,traindataactivity)
alldata <- rbind(testdata2, traindata2)

# Extracts only the measurements on the mean and standard deviation  
##for each measurement and keeps the activity name

alldata <- alldata[ , grepl( "mean|std|activity", names(alldata))]

#Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table('UCI HAR Dataset/activity_labels.txt')

alldata$activity <- factor(alldata$activity,
                            levels = activitylabels$V1,
                            labels = activitylabels$V2)

#brings in subject data and combines it with the current dataset

#reads in subject data
subjecttestdata <- read.table('UCI HAR Dataset/test/subject_test.txt')
subjecttraindata <- read.table('UCI HAR Dataset/train/subject_train.txt')
# combines test and train data
subjectdata <- rbind(subjecttestdata, subjecttraindata)
#names the variable 'subject'
names(subjectdata)[1] <- 'subject'
#combines the subjectdata with the rest of the data
alldata <- cbind(alldata, subjectdata)

##From the data set in step 4, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject
library(dplyr)
seconddataset <- alldata %>%
                 group_by(activity, subject) %>%
                 summarise_each(funs(mean))


