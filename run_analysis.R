## Description:  The purpose for 'run_analysis.R' is to process the 'test' and 'train' data into a tidy
##                  data that includes variables related to the mean and standard deviation

##               There are 2 sets of data used by both 'train' and 'test' unique data sets:  
##                1) 'activity_labels.txt'  - Defines the activity ID and associated activity text
##                      - activity examples include: WALKING, LAYING, STANDING, etc
##                2) 'features.txt' - Contains each of the variables with descriptive ColumnNames that align with the 
##                      actual data

##               There are 2 sets of data groups, 'train' and 'test'.  Each data group contains the same file structure
##                  and similar naming convention.  The relevant files for each data group are as follows:
##               1) 'subject_[train | test].txt' - This is the subject IDs with per row alignment to the 'X_' data
##               2) 'X_[train|test].txt' - This is the data set for all the measurements
##               3) 'y_[train|test].txt' - This is the activity ID's with per row alignment to the 'X_' data  

######################
## Environment vectors

# Used for reference the same base data directory
rootDataDir <- "./Dataset"

# Used to identify the specific variables/columns for data set or exclude specific variables/columns
columnGrepPattern <- "(.mean..)|(.std..)" 
columnGrepExclusion <- "meanFreq"

######################

##Description:  The 'run_analysis' function is used to initiate and complete the following actions
##                using data collected from the accelermeters from the Samsung Galaxy S smartphone.
##  1) Extracts only the measurements on the mean and standard deviation for each measurement
##  2) Uses description activity names to name the activities in the data set
##  3) Appropriately labels the data set with descriptive variable names
##  4) Merge the training and the test sets to created one data set.
##  5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
run_analysis <- function() {

    ## Start by getting the data used across both train and test data
    activityData <- get_activityData()
    featuresData <- get_featuresData()
    
    ## Gets and Preps 'training' data set
    trainData <- prep_dataset('train',activityData,featuresData)

    # Gets and Preps 'test' data set
    testData <- prep_dataset('test',activityData,featuresData)
    
    # Merge data together
    mergedData <- merge_wearable_datasets(trainData,testData)
    
    # Tidy up the data for text output
    tidyData <- process_dataset(mergedData)
    
    # Write tidy data to text file
    output_dataset(tidyData)
    
    # Return merged Data that is not processed into averages by subject_id and activity
    mergedData
 }
 

## Description:  'get_activityData function is so that the general labels  are only loaded once
##                  then referenced in merging with either the training data or the test data
## Input: none
## Returns: 'activity' dataset
get_activityData <- function() {

    # Build the filename
    activityDataFile <- sprintf("%s/activity_labels.txt",rootDataDir)

    # Create usable variable/column names
    activityColNames <- c('activity_id','activity')
    
    # Read data
    activityData <- read.table(activityDataFile, header = FALSE, sep = "",col.names = activityColNames)
    
    # Return data
    activityData

}

## Description:  'get_featuresData function is so that the general labels  are only loaded once
##                  then referenced in merging with either the training data or the test data
## Input: none
## Returns: 'features' dataset
get_featuresData <- function() {

    # Build the filename
    featuresDataFile <- sprintf("%s/features.txt",rootDataDir)
    
    # Create usable variable/column names
    featuresColNames <- c('features_id','features')
    
    # Read data
    featuresData <- read.table(featuresDataFile, header = FALSE, sep = "",col.names = featuresColNames)
    
    # Return data
    featuresData 
}

## Description:  The 'prep_dataset' function gets and prepares a data set given the csv file or files
##                  and joins the relevant sets together
## Input:  data folder, activityData, featuresData
## Returns: Singled joined dataset for either 'training' or 'test'
prep_dataset <- function(datafolder,activityData,featuresData) {

    # Build the filename
    subjectDataFile <- sprintf("%s/%s/subject_%s.txt",rootDataDir,datafolder,datafolder)
    
    # Create usable variable/column name that aligns with activity data set
    subjectDataColNames <- c('subject_id')
    
    # Read data for subjects
    subjectData <- read.table(subjectDataFile, header = FALSE, sep = "", col.names = subjectDataColNames)
    

    # Build the filename
    yDataFile <- sprintf("%s/%s/y_%s.txt",rootDataDir,datafolder,datafolder)
    
    # Create usable variable/column name that aligns with activity data set
    yDataColNames <- c('activity_id')
    
    # Read data
    yData <- read.table(yDataFile, header = FALSE, sep = "", col.names = yDataColNames)
    
    # Merge the yData and activity text by the activity_id, in order to add the associated activity text related to the
    #   yData containing the activity_id for each row of measurements (xData)
    yData <- merge(yData, activityData, by = "activity_id", all = TRUE)
 
    # Join together with the subject data
    yData <- cbind(subjectData,yData)

    
    # Add an additional 'source' variable/column that defines the source of the data, either 'train' or 'test'
    #  adding as a Factor in order to match the class of the 'activity' variable/column
    #yData$source <- factor(datafolder);

    
    # Build the filename
    xDataFile <- sprintf("%s/%s/X_%s.txt",rootDataDir,datafolder,datafolder)
    
    # Create usable variable/column name that aligns with the features data set
    xDataColNames <- featuresData$features
    
    # Read data
    xData <- read.table(xDataFile, header = FALSE, sep = "", col.names = xDataColNames)
    
    # Filter out any unneeded variables/columns based on pattern match
    xData <- filter_columns(xData,columnGrepPattern)    


    # Join data together for a single set
    xData <- cbind(yData,xData)

    # As a final clean-up, remove the 'activity_id' from the data set
    xData$activity_id <- NULL

    # Return final, prepared data set
    xData

}

## Description: 'filter_columns' function filters out all columns except those related to standard deviation and mean
## Input: data set, grep pattern to identify specific variables/columns
## Returns: filtered variable/column data set
filter_columns <- function(dataSet,columnGrepPattern) {

    # table with only the variables/columns needed based on the grep pattern
    filteredSet <- dataSet[,grep(columnGrepPattern,colnames(dataSet))]
    
    # exclude variables/columns from filteredSet using the columnGrepExclusion vector
    filteredSet <- filteredSet[,grep(columnGrepExclusion,colnames(filteredSet),invert=TRUE)]
    
    # Return data
    filteredSet
}


## Description:  The 'merge_wearable_datasets' merges the training and test sets to create one data set
## Input:  trainingData, testData
## Return: merged raw data set
merge_wearable_datasets <- function(train, testData) {

    # Basic merge since all variables/columns match
    mergedData <- merge(train, testData, all=TRUE)

    # Return merged data
    mergedData
} 


## Description:  The 'process_dataset' uses the combined data to find the average of each variable for each subject
##                  and each activity
## Input: Merged dataset
## Returns:  Tidy data set
process_dataset <- function(mergedData){

    # Melt data using the subject_id and activity as ID
    meltedData <- melt(mergedData,id=c("subject_id","activity"))
    
    #Casting to combine values by subject id and activity and perform a mean
    tidyData <- dcast(meltedData, subject_id + activity ~ variable, mean)

    # Returned tidy data
    tidyData
} 

## Description: The 'output_dataset' takes a data frame and writes it a file called 'tidydata.txt'
## Input:  data frame (preferably tidy)
## Returns: none
## Outputs: comma delimited file named tidydata.txt
output_dataset <- function(tidyData) {

    # Write the table to a text file
    write.table(tidyData, file="tidydata.txt", append = FALSE, sep=",",eol = "\n",col.names=TRUE,row.names=FALSE,fileEncoding="",quote = FALSE)

}