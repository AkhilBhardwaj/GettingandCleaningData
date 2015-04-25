### Final Dataset created is tidy_data.txt

# Before Step 1 is started, the file activity_labels.txt & features.txt is read. 
 

#Step 1 of the Code does the following Steps:
1.Set the directory location to Train Folder
2. Reads the Datasets Subject_Train.txt, y_train.txt & x_train.txt
3. Changes the directory location to Test Folder
4. Reads the Datasets Subject_Test.txt, y_test.txt & x_test.txt
5. Does a row binding of Train & Test datasets to create objects corresponding to Subject, y & X file.
6. An object named 'Data' is created by performing a column binding of Subject, y & X data elements



#Step 2 of the code does the following steps:
1. From the features file, the location of the variables that have either mean or frequency in their names is ascertained. 
2. From the data X, only those columns are kept which are corresponding to the position of variables with either mean or standard deviation measures. 

#Step 3 of the code does the following steps:
1. The combined data of Subect, y & X (with only relevant columns) is taken
2. The merge of activity labels to corresponding activity codes is done using merge function. 

#Step 4 of the code does the following steps:
1. Measurement names corresponding to Mean & Standard deviation are taken. 
2. These measurement names are updated in the X2 dataset
3. Data set is created with corresponding activity labels
4. The time & frequency measurement names are elaborated to be explicit about the time & frequency measurements
5. The variables names are overall cleaned.

#Step 5 of the code does the following step
1. Keeping variables Subject, Activity Code & Activity Labels as unique, the other variables are summarised to be the mean of original measurement.
2. The mean of each measurement is computed at Subject & Activity level.
