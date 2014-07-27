# Setup file name variables
folderName <- "UCI HAR DataSet"
columnNamesFile <- paste(folderName,"/features.txt",sep = "")
## Test files
testSub <- paste(folderName,"/test/subject_test.txt",sep = "")
testY <- paste(folderName,"/test/y_test.txt",sep = "")
testX <- paste(folderName,"/test/X_test.txt",sep = "")
## Training Files
trainSub <- paste(folderName,"/train/subject_train.txt",sep = "")
trainY <- paste(folderName,"/train/y_train.txt",sep = "")
trainX <- paste(folderName,"/train/X_train.txt",sep = "")

# Read Data
columnNames <- read.table(columnNamesFile, header = FALSE, colClasses = c("numeric", "character"))
colNames <- columnNames[,2]
## Test Data
testX_df <- read.table(testX,header = FALSE, col.names = colNames)
testY_df <- read.table(testY,header = FALSE,col.names = "activity")
testSub_df <- read.table(testSub,header = FALSE,col.names = "subID")
## Training Data
trainX_df <- read.table(trainX,header = FALSE, col.names = colNames)
trainY_df <- read.table(trainY,header = FALSE,col.names = "activity")
trainSub_df <- read.table(trainSub,header = FALSE,col.names = "subID")

#Creat ID columns
testID <- cbind(testSub_df,testY_df)
testID$activity <- factor(testID$activity,levels = c(1,2,3,4,5,6), labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
trainID <- cbind(trainSub_df,trainY_df)
trainID$activity <- factor(trainID$activity,levels = c(1,2,3,4,5,6), labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

# Merge ID columns with X-Data and create Test-Train unified Dataframe
## Merge
test <- cbind(testID,testX_df)
train <- cbind(trainID,trainX_df)
## Unify
data <- rbind(train,test)

# Subset only columns with measurements on the mean and standard deviation for each metric, keeping subject ID and activity
## Creat regex logical vectors for mean() and std()
index1 <- grepl("mean()",names(data))
index2 <- grepl("std()",names(data))

## Subset & clean up
temp <- data[,index1 | index2]
index3 <- !grepl("Freq",names(temp)) ### to remove meanFreq data
index4 <- !grepl("fBodyBody",names(temp)) ### to remove fBodyBody data
temp <- temp[,index3 & index4]

data <- cbind(data[,c(1,2)],temp)

#rename variables with descriptive labels
## Clean Up labels using regex
temp <- gsub("\\.\\.\\."," in ",names(data))
temp <- gsub("BodyAcc"," Body Acceleration ",temp)
temp <- gsub("BodyGyro"," Body Gyration ",temp)
temp <- gsub("Mag","Magnitude ",temp)
temp <- gsub("GravityAcc"," Gravity Acceleration ",temp)
temp <- gsub("\\.mean","Mean",temp)
temp <- gsub("\\.std","Standard Diviation",temp)
temp <- gsub("JerkMagnitude","Jerk Magnitude",temp)
temp <- gsub("JerkMean","Jerk Mean",temp)
temp <- gsub("JerkStandard","Jerk Standard",temp)
temp <- gsub("^f ","FFT ",temp)
temp <- gsub("^t ","Time ",temp)
temp <- gsub("\\.\\.","",temp)
temp[1:2] <- c("Subject ID","Activity")
## Set new names
names(data) <- temp

#Create Second Tidy aggregated data frame 
data2 <- aggregate(data[,3:62], by=list(data[,1],data[,2]),FUN=mean, na.rm=TRUE)
names(data2[,1:2]) <- c("Subject ID","Activity")
write.table(data2,file = "tidyData.txt")