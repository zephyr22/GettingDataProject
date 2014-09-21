##Codebook:

###Variables & Source
The raw data contains values from 30 subjects and various measurements during six types of physicial activity that was collected
by Samsung galaxy S Smartphone accelerometers..

The subjects were divided into two groups test and train.  Each contains a subject file identifying the subject ID associated with the 
measurements, a y file identifying the type of activity associated with the measurement, and an x file which contains the measurements.

The following are the measurements that were kept for processing, it can be seen that each has a x, y, and z corresponding to the 
three orientational planes:
"tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
"tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
"tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
"tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
"tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
"tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
"tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
"tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
"tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
"fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
"fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
"fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
"fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
"fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Process
First the variables relate to the mean and standard deviation of measurements were identified in the x file.  These column of measurements
were then extracted from the x files.  It was decided to exclude those that were meanFreq as those variables typically had a mean measurement
and we were only interested in mean or standard deviation measurements.

Next the three files associated with each group were combined to form a test group and train group using cbind.  Then using the rbind the 
two groups were merged into one.

Using the informational files associated with the data, names were given to the variables, and the activity ID's were replaced with
the corresponding activity names.

Finally the results were grouped by Activity and Subject and the mean of the mean and standard deviation of the measurements was calculated
and written to a file called AnalysisResutls.txt.

