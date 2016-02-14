#loading libraries
library(dplyr)
library(plyr)
library(tidyr)
#loading data into R
featuresData <- read.csv("features.txt", sep="\n", header=FALSE, stringsAsFactors = FALSE)
actLabels <- read.csv("activity_labels.txt", sep=" ", header=FALSE)
trainX <- read.csv("train/X_train.txt", sep="", header=FALSE)
trainY <- read.csv("train/Y_train.txt", sep="", header = FALSE)
trainSubj <- read.csv("train/subject_train.txt", sep="", header=FALSE)
testX <- read.csv("test/X_test.txt", sep="", header=FALSE)
testY <- read.csv("test/Y_test.txt", sep="", header=FALSE)
testSubj <- read.csv("test/subject_test.txt", sep="", header=FALSE)

#changing " " to "_" in names and dropping from df to vector
featuresData <- gsub("([0-9]) ([a-z])", "\\1_\\2", featuresData$V1, perl=TRUE)
#assigning names to from features data to dataframe:
names(testX) <- featuresData
names(trainX) <- featuresData
names(trainSubj) <- "subject"
names(testSubj) <- "subject"
names(testY) <- "activity"
names(trainY) <- "activity"

#merging data from test and train
boundX <- rbind(testX,trainX)
boundY <- rbind(testY,trainY)
boundSubj <- rbind(testSubj,trainSubj)
rm(testX, trainX)
#selecting only columns containing mean and std and bounding them together
dataMeans <- select(boundX, contains("mean"))
dataStd <- select(boundX, contains("std"))
dataMeanStdBound <- cbind(boundY, boundSubj, dataMeans, dataStd)

#descriptive variable names:
names(dataMeanStdBound) <- tolower(names(dataMeanStdBound))
#renaming id's with descriptive names, that's a final result
dataMeanStdBound[["activity"]] <- actLabels[match(dataMeanStdBound[["activity"]], actLabels[["V1"]]), "V2"]
#creating second tidy data with mean for each activity and subject
tidyDF <- ddply(dataMeanStdBound, .(subject,activity), .fun=function(i) {colMeans(i[,-c(1:2)])})

#writing df to file
write.table(dataMeanStdBound, file="result1.txt", row.names = FALSE)
write.table(tidyDF, file="result2.txt", row.names=FALSE)

