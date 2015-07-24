The CodeBook.md file describes the variables, the data, and transformations or work that I performed to clean up the data.

Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made 
avaiable from the website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Feature Selection

Please refer to the README and features.txt files in the original dataset to learn more about the feature selection for 
this dataset. 

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." To be complete, I included all variables having to do with mean or standard deviation.
In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

Data processing

1 download,unzip file to the folder(UCI HAR Dataset)
2 read supporting data (features names and activities names)
3.read test and train data using read.table, then combine (rbind) same data, ie. subject, activities, or features.
4.name the columns, names of feature columns comes from feature.txt
5. Merge the columns to a dataset
6. Extract the columns names with mean or std in them
7. Creat a new dataset with subject, activity and columns with mean and std in their names.
8.Uses descriptive activity names to replace the activity labels in the data set
9.Appropriately labels the data set with descriptive variable names. First, make a list of the current column names, then make
   the following changes:
   #Acc <- Accelerometer
   #Gyro<- Gyroscope
   #BodyBody <-Body
   #Mag <- Magnitude, etc.
10. Get the mean for each combination of subject and label, and create a new tidy dataset.
 11. Creates an independent tidy data set from the above dataset, write the data in "tidyDataset.txt".
 
 Here are the variable names occurred in tidyDataset.txt.
 
 [1] "Subject"                                        "Activity"                                       "tBodyAccelerometerMean()-X"                    
 [4] "tBodyAccelerometerMean()-Y"                     "tBodyAccelerometerMean()-Z"                     "tBodyAccelerometerSTD()-X"                     
 [7] "tBodyAccelerometerSTD()-Y"                      "tBodyAccelerometerSTD()-Z"                      "tGravityAccelerometerMean()-X"                 
[10] "tGravityAccelerometerMean()-Y"                  "tGravityAccelerometerMean()-Z"                  "tGravityAccelerometerSTD()-X"                  
[13] "tGravityAccelerometerSTD()-Y"                   "tGravityAccelerometerSTD()-Z"                   "tBodyAccelerometerJerkMean()-X"                
[16] "tBodyAccelerometerJerkMean()-Y"                 "tBodyAccelerometerJerkMean()-Z"                 "tBodyAccelerometerJerkSTD()-X"                 
[19] "tBodyAccelerometerJerkSTD()-Y"                  "tBodyAccelerometerJerkSTD()-Z"                  "tBodyGyroscoperMean()-X"                       
[22] "tBodyGyroscoperMean()-Y"                        "tBodyGyroscoperMean()-Z"                        "tBodyGyroscoperSTD()-X"                        
[25] "tBodyGyroscoperSTD()-Y"                         "tBodyGyroscoperSTD()-Z"                         "tBodyGyroscoperJerkMean()-X"                   
[28] "tBodyGyroscoperJerkMean()-Y"                    "tBodyGyroscoperJerkMean()-Z"                    "tBodyGyroscoperJerkSTD()-X"                    
[31] "tBodyGyroscoperJerkSTD()-Y"                     "tBodyGyroscoperJerkSTD()-Z"                     "tBodyAccelerometerMagnitudeMean()"             
[34] "tBodyAccelerometerMagnitudeSTD()"               "tGravityAccelerometerMagnitudeMean()"           "tGravityAccelerometerMagnitudeSTD()"           
[37] "tBodyAccelerometerJerkMagnitudeMean()"          "tBodyAccelerometerJerkMagnitudeSTD()"           "tBodyGyroscoperMagnitudeMean()"                
[40] "tBodyGyroscoperMagnitudeSTD()"                  "tBodyGyroscoperJerkMagnitudeMean()"             "tBodyGyroscoperJerkMagnitudeSTD()"             
[43] "fBodyAccelerometerMean()-X"                     "fBodyAccelerometerMean()-Y"                     "fBodyAccelerometerMean()-Z"                    
[46] "fBodyAccelerometerSTD()-X"                      "fBodyAccelerometerSTD()-Y"                      "fBodyAccelerometerSTD()-Z"                     
[49] "fBodyAccelerometerMeanFreq()-X"                 "fBodyAccelerometerMeanFreq()-Y"                 "fBodyAccelerometerMeanFreq()-Z"                
[52] "fBodyAccelerometerJerkMean()-X"                 "fBodyAccelerometerJerkMean()-Y"                 "fBodyAccelerometerJerkMean()-Z"                
[55] "fBodyAccelerometerJerkSTD()-X"                  "fBodyAccelerometerJerkSTD()-Y"                  "fBodyAccelerometerJerkSTD()-Z"                 
[58] "fBodyAccelerometerJerkMeanFreq()-X"             "fBodyAccelerometerJerkMeanFreq()-Y"             "fBodyAccelerometerJerkMeanFreq()-Z"            
[61] "fBodyGyroscoperMean()-X"                        "fBodyGyroscoperMean()-Y"                        "fBodyGyroscoperMean()-Z"                       
[64] "fBodyGyroscoperSTD()-X"                         "fBodyGyroscoperSTD()-Y"                         "fBodyGyroscoperSTD()-Z"                        
[67] "fBodyGyroscoperMeanFreq()-X"                    "fBodyGyroscoperMeanFreq()-Y"                    "fBodyGyroscoperMeanFreq()-Z"                   
[70] "fBodyAccelerometerMagnitudeMean()"              "fBodyAccelerometerMagnitudeSTD()"               "fBodyAccelerometerMagnitudeMeanFreq()"         
[73] "fBodyAccelerometerJerkMagnitudeMean()"          "fBodyAccelerometerJerkMagnitudeSTD()"           "fBodyAccelerometerJerkMagnitudeMeanFreq()"     
[76] "fBodyGyroscoperMagnitudeMean()"                 "fBodyGyroscoperMagnitudeSTD()"                  "fBodyGyroscoperMagnitudeMeanFreq()"            
[79] "fBodyGyroscoperJerkMagnitudeMean()"             "fBodyGyroscoperJerkMagnitudeSTD()"              "fBodyGyroscoperJerkMagnitudeMeanFreq()"        
[82] "Angle(tBodyAccelerometerMean,Gravity)"          "Angle(tBodyAccelerometerJerkMean),GravityMean)" "Angle(tBodyGyroscoperMean,GravityMean)"        
[85] "Angle(tBodyGyroscoperJerkMean,GravityMean)"     "Angle(X,GravityMean)"                           "Angle(Y,GravityMean)"                          
[88] "Angle(Z,GravityMean)"                          
