# run_analysis.R

# Download data file
dataFile <- "getdata_data_projectfiles_UCI_HAR_Dataset.zip"
if (!file.exists(dataFile)){
    print("Downloading data file")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dataFile, "curl")
} else {
    print("File already exists locally")
}

# Merge the training and the test sets to create one data set.


# Extract the measurements on the mean and standard deviation for each measurement.


# Use descriptive activity names to name the activities in the data set


# Labels the data set with descriptive variable names.


# Creates a tidy data set from preceding steps with the average of each variable
# for each activity and each subject.
