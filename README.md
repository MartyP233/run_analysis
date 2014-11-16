run_analysis
============

This repo has been created for the 'Getting and Cleaning data' coursera course
assignment. The assignment involves processing data from 'Human Activity 
Recognition Using Smartphones Data set', which is stored in several individual
datasets. The assignment requires you to create a complete tidy dataset of selected information, and creating a second tidy dataset which contains average data cut
by activity and subject.

The assignment also asks for the second tidy dataset to be submitted as a txt
file. The code to read this txt file back into R is contained in the supplementary
information in this readme file.

This repo contains:

- the main R code file, called run_analysis.R
- a codebook that describes the variables, the data, and the transformations
or work to clean up the data, called codebook.md
- a readme file (that you are currently reading), that describes
how the script works, readme.md

###Description

run_analysis.R is an R script which requires you to have downloaded the UCI HAR
dataset, and for the folder to be saved in your working directory. You can 
download the folder from the following link:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/

####Description of the data used

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#### Description of the code

*Caution* this syntax contains code to clear the workspace except for the
main dataset, i.e. this will clear your workspace if you run it.

The code processes through the following steps to create a complete tidy dataset of all features that include mean or std, with the associated activity and subject identifiers. From the tidy dataset it then creates a second tidy dataset which contains average data cut by activity and subject.

- Step 1 Read in the test feature data, activity data and subject data
- Step 2 Read in the train feature data, activity data and subject data
- Step 3 Read in the feature label data
- Step 4 Appropriately label the feature datasets with descriptive variable names
- Step 5 Appropriate name the activity & subject variable in the test & train
activity and subject datasets
- Step 6 Merge the activity data with the feature data for test & train
- Step 7 Merge the test & train data together
- Step 8 Remove the precursor  datasets to clear up the workspace
- Step 9 Extract only the measurements on the mean and standard deviation  
for each measurement and keep the activity & subject data
- Step 10 Read in the activity labels data and use descriptive activity names 
to name the activities in the data set
- Step 11 From the dataset in step 10, creates a second, independent tidy data set with
the average of each variable for each activity and each subject

### Supplementary Information

To read in the text file that contains mean data for each feature by
activity and subject, run the following code:

meandatasetfromtxt <- read.table('meandataset.txt', header = TRUE)