# Summarization of Human Activity Data Collected by Smartphones

This work is a summarization of human activity data acquired for the paper _Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine._ by Davide Anguita et al.[1]  It further summarizes the summary data provided in their dataset producing mean values for several of the output variables for each activity performed by each subject in their datasets.

## Source Data

This analysis was performed on the datasets found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  This zip file contains multiple, related datasets used to create and verify algorithms to recognize different forms of human activity via accelerometer and gyroscope data from smartphones.

Separate data files within the zip file describe the data used ot train the algorithms, test the algorithms, the subjects in each row data, the variables in each column of data and the labels for each activity.

The source data also includes detailed documentation on the acquisition and processing of this data.

## Analysis

This work combines the separate datasets so that a means value can be calculated for each of several variables for each activity performed by each subject.  Descriptive labels are applied to each of the activities and each of the variables.  The variables included in the final tidy dataset are the subject identifier, the activity label and each variable for which the source data had a calculated mean or standard deviation.

## Tools

The resultant tidy data set is created by the R script, run_analysis.R, included in this repository.  This script performs these steps:

* Download the source data
* Extract the source data files
* Create vectors of variables and variable labels for inclusion in the tidy dataset.
* Read means and standard deviation data from the test and train data sets
* Read subject and activity identifier data
* Read activity labels
* Combine test, train, subject, activity and activity label data
* Produce means values for each of the variables in the assembled data grouped by Subject and Activity
* Write a tidy dataset of the grouped means values

## Using run_analysis.R

The script run_analysis.R requires Base R and the packages dplyr and data.table.  If they are not already installed in R, install them with these commands from inside R:

	install.packages("dplyr")
	install.packages("data.table")

Then source the script to download the dataset, run the analysis and generate the output.

	source("run_analysis.R")

The tidy data set will be written the to file uci_har_tidy_data.txt

## Results

The tidy dataset created by run_analysis.R is described in the file [CodeBook.md](CodeBook.md) included in this repo.

## Citations

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
