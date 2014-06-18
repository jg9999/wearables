### File Descriptions  
### General data used across both 'train' and 'test'  
   There are 2 sets of data used by both 'train' and 'test' unique data sets:    
    1) 'activity_labels.txt'  - Defines the activity ID and associated activity text  
          - activity examples include: WALKING, LAYING, STANDING, etc  
    2) 'features.txt' - Contains each of the variables with descriptive ColumnNames that align with the   
          actual data  
  
### Groups of data  
   There are 2 sets of data groups, 'train' and 'test'.  Each data group contains the same file structure  
      and similar naming convention.  The relevant files for each data group are as follows:  
   1) 'subject_[train | test].txt' - This is the subject IDs with per row alignment to the 'X_' data  
   2) 'X_[train|test].txt' - This is the data set for all the measurements  
   3) 'y_[train|test].txt' - This is the activity ID's with per row alignment to the 'X_' data    
  
### Tidy Data output  
   There is a final output file called 'tidydata.txt' that contains a comma delimited variables and observations  
     that reshapes the data to find the average of each variable for each subject and activity.   The 'tidydata.txt'   
     is ordered by the 'subject_id' and then by the 'activity'.  Please see codebook for variable name details  
       
  
##Non-measurement Variables in tidy data set  
subject_id - the ID of the subject performing an activity and the associated measurements  
activity - the text based label for the activity performed joined using the activity_id  
  
##Measurement variables in tidy data set.    
All are from the original data set and ALL are the AVERAGE value by the 'subject_id' and the 'activity'  
  
tBodyAcc.mean...X  
tBodyAcc.mean...Y  
tBodyAcc.mean...Z  
tBodyAcc.std...X  
tBodyAcc.std...Y  
tBodyAcc.std...Z  
tGravityAcc.mean...X  
tGravityAcc.mean...Y  
tGravityAcc.mean...Z  
tGravityAcc.std...X  
tGravityAcc.std...Y  
tGravityAcc.std...Z  
tBodyAccJerk.mean...X  
tBodyAccJerk.mean...Y  
tBodyAccJerk.mean...Z  
tBodyAccJerk.std...X  
tBodyAccJerk.std...Y  
tBodyAccJerk.std...Z  
tBodyGyro.mean...X  
tBodyGyro.mean...Y  
tBodyGyro.mean...Z  
tBodyGyro.std...X  
tBodyGyro.std...Y  
tBodyGyro.std...Z  
tBodyGyroJerk.mean...X  
tBodyGyroJerk.mean...Y  
tBodyGyroJerk.mean...Z  
tBodyGyroJerk.std...X  
tBodyGyroJerk.std...Y  
tBodyGyroJerk.std...Z  
tBodyAccMag.mean..  
tBodyAccMag.std..  
tGravityAccMag.mean..  
tGravityAccMag.std..  
tBodyAccJerkMag.mean..  
tBodyAccJerkMag.std..  
tBodyGyroMag.mean..  
tBodyGyroMag.std..  
tBodyGyroJerkMag.mean..  
tBodyGyroJerkMag.std..  
fBodyAcc.mean...X  
fBodyAcc.mean...Y  
fBodyAcc.mean...Z  
fBodyAcc.std...X  
fBodyAcc.std...Y  
fBodyAcc.std...Z  
fBodyAccJerk.mean...X  
fBodyAccJerk.mean...Y  
fBodyAccJerk.mean...Z  
fBodyAccJerk.std...  
  
  
## Other Variables used in joining data  
 but not in the tidy dataset  
activity_id - this is the id to associate with the text based 'activity'  
  
  
### Features Overview  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals   
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of  
50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner   
frequency of 20 Hz to remove noise. Similarly  
 the acceleration signal was then separated into body and gravity   
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner   
frequency of 0.3 Hz.   
  
Subsequently  
 the body linear acceleration and angular velocity were derived in time to obtain Jerk signals   
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated   
using the Euclidean norm (tBodyAccMag  
 tGravityAccMag  
 tBodyAccJerkMag  
 tBodyGyroMag  
 tBodyGyroJerkMag).   
  
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ  
 fBodyAccJerk-XYZ  
   
fBodyGyro-XYZ  
 fBodyAccJerkMag  
 fBodyGyroMag  
 fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  
  
These signals were used to estimate variables of the feature vector for each pattern:    
'-XYZ' is used to denote 3-axial signals in the X  
 Y and Z directions.  
  
### Special Notes  
Of the available features  
 only the standard deviation and mean for each where used.  Also  
 the 'meanFreq' was  
excluded since this was the frequency of the 'mean' and not the 'mean' itself  
  
### Signal Measurements used  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  
  
The set of variables that were estimated from these signals are:   
mean(): Mean value  
std(): Standard deviation  
  
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
  
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  
  
  