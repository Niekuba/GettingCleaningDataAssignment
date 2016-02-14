Data which script processes:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

How script works:
- loads alreay un-zipped data into memory
- renames colnames
- merges data from tests and train directories
- subsets variables with mean and standart deviation
- binds subjects, activities, means and stds together
- changes activity id with it's descriptive name
- generates another dataset with mean for each subject and each activity
- writes processed data into files

Variables in script:
actLabels - variable connecting activity id with it's name
testY, trainY - variables containing activity id of each observation
testSubj, trainSubj - variables containing test subject of each observation
testX,trainX - variables containing all the observations
featuresData - containing names of observation's variables

boundX, boundY,boundSubj - containing merged test and train data (previous variables)

dataMeans - df containing only mean variables
dataStd - df containing only standard deviation variables
dataMeanStdBond - df containing mean and std variables together (stored in result1.txt)

tidyDF - df containing mean of each variable for each observation and each activity (stored in result2.txt)


