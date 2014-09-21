GettingDataProject
==================
The CodeBook.md contains generally information on the dataset: variables used, the data and transformations performed on the data.

The Run_Analysis.R file contains the exact code used to transform the data.
It assumes the user is in a directory that contains the files form the zip file.  First it uses the features.txt file to get the variable 
names and extract those column names that match on mean or std.  Next it removes those from the filtered list created that match on meanFreq.

Next the script downloads the subject, x, and y files associated with the test and train groups.  The x file is filtered by only the columns 
that were filtered on above.  Subsequently the three files for each group were combined using cbind and then the two groups were combined 
using rbind.

Finally the column names and values were updated to be readable.  Including replacing the activity IDs with the corresponding names.  
The data was then summarized by subject ID and activity with the results being written to a file called AnalysisResults.txt in the working directory.
