# CodeBook

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

## Variables

The data contain 68 variables.

* _activity_ is a factor with six levels identifying the 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* _subject_ is a factor identiyfing the test subject.  It has levels 1 - 30.
* (features) - the remaining 66 variables are the mean of a subset of the feature measured in the source dataset.  The values are the mean of each of each feature value described in the source dataset grouped by activity and subject.  The details of those features are described in the section _Feature Selection_ below.


## Feature Selection

_Note: this section has been adapted from codebook for the UCI HAR Dataset source files, specifically the file features_info.txt.  Where applicabale, the original text from the source files has been preserved.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  The mean and standard deviation for each trial was then calculated.  The trials were then grouped by activity and trial and the average for each mean and standard deviation was calculated.  Those values appear in these variables:

* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z

* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z

* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  The mean and standard deviation for each trial was then calculated.  The trials were then grouped by activity and trial and the average for each mean and standard deviation was calculated.  Those values appear in these variables:

* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z

* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z

* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  The mean and standard deviation for each trial was then calculated.  The trials were then grouped by activity and trial and the average for each mean and standard deviation was calculated.  Those values appear in these variables:

* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z

* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z

* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z

* fBodyAccMag.mean
* fBodyAccMag.std

* fBodyAccJerkMag.mean
* fBodyAccJerkMag.std

* fBodyGyroMag.mean
* fBodyGyroMag.std

* fBodyGyroJerkMag.mean
* fBodyGyroJerkMag.std
