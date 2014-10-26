# run_analysis.R

# load required libraries
library(data.table)
library(dplyr)

# Download data file
dataFile <- "getdata_data_projectfiles_UCI_HAR_Dataset.zip"
if (!file.exists(dataFile)){
    print("Downloading data file")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dataFile, "curl")
} else {
    print("File already exists locally")
}

# Extract the contents of the zip file
unzip(dataFile)

# Build vector of trues and falses to extract
# mean and standard deviation data values from data files.
# First initialize to the size we need with all values false.
mask <- rep(FALSE, 561)

# Use an array enumerating each row in the features.txt file that
# matched the pattern "mean|std". This list was created with this
# shell script:
#
#      cat features.txt | grep "mean()\|std()" | sed -e "s/ .*/, /;"
#
trueValues <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44,
    45, 46, 81, 82, 83, 84, 85, 86, 121, 122,
    123, 124, 125, 126, 161, 162, 163, 164, 165, 166,
    201, 202, 214, 215, 227, 228, 240, 241, 253, 254,
    266, 267, 268, 269, 270, 271, 345, 346, 347, 348,
    349, 350, 424, 425, 426, 427, 428, 429, 503, 504,
    516, 517, 529, 530, 542, 543
    )

mask[trueValues] <- TRUE

# Use the mask to create vector indicating which columns should be
# read from training and test datasets.
# These files are fixed width files.  Each column is 16 characters wide.
# A value of  16 indicates we should read those characters as a column.
# A value of -16 indicates we should skip those characters in the file.
feature_widths <- rep(-16, 561)
feature_widths[mask] <- 16

# Label the data set(s) with descriptive variable names.
# Read the variable names for the whole dataset
variablesFile <- "UCI HAR Dataset/features.txt"
colName <- c("variableNumber", "variable")
variables <- read.table(variablesFile, sep=" ", col.names=colName)
# extract names of with the pattern  "mean|std" using the mask
variable.names <- variables$variable[mask]
# replace parens in variable.names
variable.names <- sub("\\(\\)", "", variable.names)
# replace hyphens in variable.names
variable.names <- gsub("-", ".", variable.names)
# replace "BodyBody" with "Body" variable.names
variable.names <- sub("BodyBody", "Body", variable.names)

# Get the data
# These file are training and test data
trainDataFile <- "UCI HAR Dataset/train/X_train.txt"
testDataFile <- "UCI HAR Dataset/test/X_test.txt"
# Read the data sets
trainData <- read.fwf(trainDataFile, feature_widths, sep='',
    col.names=variable.names)
testData <- read.fwf(testDataFile, feature_widths, sep='',
    col.names=variable.names)

# Get the subjects
# files that identify the subject in each row of data above
trainSubjectFile <- "UCI HAR Dataset/train/subject_train.txt"
testSubjectFile <- "UCI HAR Dataset/test/subject_test.txt"
# read the subjects
colName <- c("subject")
trainSubject <- read.table(trainSubjectFile, col.names=colName)
testSubject <- read.table(testSubjectFile, col.names=colName)

# get the activities
# files that identify the activity in each row of data above
trainActivityFile <- "UCI HAR Dataset/train/y_train.txt"
testActivityFile <- "UCI HAR Dataset/test/y_test.txt"
# read the activities
colName <- c("activity_code")
trainActivity <- read.table(trainActivityFile, col.names=colName)
testActivity <- read.table(testActivityFile, col.names=colName)

# get the activity labels
activityLabelFile <- "UCI HAR Dataset/activity_labels.txt"
# read the labels
colName <- c("activity_code", "activity")
activityLabel <- read.table(activityLabelFile, sep=" ", col.names=colName)

# Merge all the components of the training data into one dataframe
train <- cbind(trainSubject, trainActivity, trainData)

# Merge all the components of the test data into one dataframe
test <- cbind(testSubject, testActivity, testData)

# Merge the training and the test sets to create one data set.
combinedData <- rbind(train, test)

# Use descriptive activity names to name the activities in the data set
data <- merge(activityLabel, combinedData, by="activity_code")

# remove activity_code column as it is now redundant
data <- subset(data, select=-c(activity_code))

# write the merged, labeled dataset
dataFile <- "merged-and-labeled-mean-and-std-data.csv"
write.table(data, dataFile)

# Create a tidy data set from preceding steps with the average of each variable
# for each activity and each subject.
# use the dplyr library
tidy.data <- group_by(data, activity, subject) %>% summarise_each(funs(mean))

# Write that data out to a file
write.table(tidy.data, "uci_har_tidy_data.csv", row.name=FALSE)
