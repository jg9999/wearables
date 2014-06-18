### Introduction  
  
This is a course project related to wearables that required to collect, work with and clean a data set based on  
wearable computing measurements.    
  
### Overview  
Description:  The purpose for 'run_analysis.R' is to process the 'test' and 'train' data into a tidy  
                  data that includes variables related to the mean and standard deviation  
  
Analysis File: 'run_analysis.R'  
  
###Note  
Only the 'run_analysis()' function is used and needed to process data.    
All of the other functions listed below are called by the 'run_analysis()' function as needed  
  
  
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
  
  
## Outline of main function, 'run_analysis()'  
This is the outline of how the 'run_analysis()' function works  
    1) Start by getting the data used across both train and test data  
    2) Gets and Preps 'training' data set  
    3) Gets and Preps 'test' data set  
    4) Merge data together  
    5) Tidy up the data for text output  
    6) Write tidy data to text file that is an independent tidy data set with the average  
         of each variable for each activity and each subject.  
    7) Return merged, pre-'Melted' Data which is not shaped into averages by subject_id and activity   
  
  
## Function Details  
Below are the custom functions written to support 'run_analysis.R'    
  
Note: Only the 'run_analysis()' function is used and needed to process data.    
All of the other functions listed below are called by the 'run_analysis()' function as needed  
   
###Function:  'run_analysis()'  
Description:  The primary function 'run_analysis' is used to initiate and complete the following actions  
                using data collected from the accelermeters from the Samsung Galaxy S smartphone.  
  1) Extracts only the measurements on the mean and standard deviation for each measurement  
  2) Uses description activity names to name the activities in the data set  
  3) Appropriately labels the data set with descriptive variable names  
  4) Merge the training and the test sets to created one data set.  
  5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
Inputs: none  
Returns: complete, merged dataset containing the standard deviation and mean measurements, with descriptive variable names  
Outputs:  'tydydata.txt' file that contains an independent tidy data set with the avg of each variable for each subject  
            and each activity  
  
    
###Function:  'get_activityData' 
Description:  'get_activityData function is so that the general labels  are only loaded once  
                  then referenced in merging with either the training data or the test data  
Input: none  
Returns: 'activity' dataset  
   

###Function:  'get_featuresData'  
Description:  'get_featuresData function is so that the general labels  are only loaded once  
                  then referenced in merging with either the training data or the test data  
Input: none  
Returns: 'features' dataset  
   
###Function:  'prep_dataset'
Description:  The 'prep_dataset' function gets and prepares a data set given the csv file or files  
                  and joins the relevant sets together  
 Input:  data folder, activityData, featuresData  
 Returns: Singled joined dataset for either 'training' or 'test'  
  
###Function:  'filter_columns'
Description: 'filter_columns' function filters out all columns except those related to standard deviation and mean  
Input: data set, grep pattern to identify specific variables/columns  
Returns: filtered variable/column data set  
  
###Function:  'merge_wearable_datasets'
Description:  The 'merge_wearable_datasets' merges the training and test sets to create one data set  
Input:  trainingData, testData  
Return: merged raw data set  
  
###Function:  'process_dataset'
Description:  The 'process_dataset' uses the combined data to find the average of each variable for each subject  
                  and each activity  
Input: Merged dataset  
Returns:  Tidy data set  
  
###Function: 'output_dataset'
Description: The 'output_dataset' takes a data frame and writes it a file called 'tidydata.txt'  
Input:  data frame (preferably tidy)  
Returns: none  
Outputs: comma delimited file named tidydata.txt  