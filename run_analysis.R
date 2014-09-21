
# download the file to working directory
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "projectdata.zip", mode = "wb")

#unzip the file in working directory
#unzip("projectdata.zip")

#Move working directory into folder
setwd("C:/Users/Solomon/Desktop/Jenn/R Coursera/Inference")
setwd(paste(getwd(),"/UCI HAR DATASET",sep=""))

#load variable name file
features <- read.table("features.txt")
#get mean and std columns
#match on column names with mean or std
ptn = "(.mean.)|(.std.)"
#put matching column names in here
good <- grep(ptn, features$V2, perl = T)
ptn = ".meanFreq."
badmean <- grep(ptn, features$V2, perl=T)
keep <- good[! good %in% badmean]


#load test files
testx <- read.table("./test/X_test.txt")
names(testx) <- features$V2
#restrict to just mean & std columns
testxKeep <- testx[,keep]


testy <- read.table("./test/y_test.txt")
#Replace Activity ID with activity Name
testy <- replace(testy, testy == 1, "WALKING")
testy <- replace(testy, testy == 2, "WALKING_UPSTAIRS")
testy <- replace(testy, testy == 3, "WALKING_DOWNSTAIRS")
testy <- replace(testy, testy == 4, "SITTING")
testy <- replace(testy, testy == 5, "STANDING")
testy <- replace(testy, testy == 6, "LAYING")
names(testy) <- "Activity"


testSubject <- read.table("./test/subject_test.txt")
names(testSubject) <- "SubjectID"

#Combine test files
testData <- cbind(testy, testSubject, testxKeep)


#load train files
trainx <- read.table("./train/X_train.txt")
names(trainx) <- features$V2
#restrict to just mean & std columns
trainxKeep <- trainx[,keep]


trainy <- read.table("./train/y_train.txt")
#Replace Activity ID with activity Name
trainy <- replace(trainy, trainy == 1, "WALKING")
trainy <- replace(trainy, trainy == 2, "WALKING_UPSTAIRS")
trainy <- replace(trainy, trainy == 3, "WALKING_DOWNSTAIRS")
trainy <- replace(trainy, trainy == 4, "SITTING")
trainy <- replace(trainy, trainy == 5, "STANDING")
trainy <- replace(trainy, trainy == 6, "LAYING")
names(trainy) <- "Activity"

trainSubject <- read.table("./train/subject_train.txt")
names(trainSubject) <- "SubjectID"
#Combine test files
trainData <- cbind(trainy, trainSubject, trainxKeep)

combine <- rbind(testData, trainData)


#summarize mean of each column
library(plyr)
combine$group <- paste(combine$Activity, combine$SubjectID, sep="-")
group <- ddply(combine, .(group), numcolwise(mean))
#Copy summary to file
write.table(group, file="AnalysisResults.txt", row.name=FALSE)