Instructions:
- script works ONLY while in main folder with data to process ("UCI HAR Dataset")
- script generates 2 files: result1.txt and result2.txt, both in same directory as the script
- result1.txt contains merged and tidy data with all the mean and std variables
- restult2.txt contains data with mean of each variable for each subject and each activity

How script actually works:
- loads alreay un-zipped data into memory
- renames colnames
- merges data from tests and train directories
- subsets variables with mean and standart deviation
- binds subjects, activities, means and stds together
- changes activity id with it's descriptive name
- generates another dataset with mean for each subject and each activity
- writes processed data into files
