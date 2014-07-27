CodeBook 
=================

Feature Description per: 
-----------------------
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Process:
--------
1. Load files from train and test folders onto environment as well as column names from the 'features.txt' file, ensuring that features.txt is read as strings.
2. Merge subject id's, y-file and x-file, ensuring the activities numbered in the y-file are coerced into factors per 'activity_labels.txt' file, for both training and test. (Factor w/ 6 levels:"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING")
3. Combine both test and training data frames into one data frame named 'data'
4. Subset only columns thar pertain to mean and standrad deviation (without meanFreq or fBodyBody variables)
5. Rename labels of 'data' to be more descriptive using regex
6. Create second tidy aggregated data frame with the average of each variable for each activity and each subject

Variable Labelling:
-------------------
* Prefix 't' to denote time, hence changed to Time
* Prefix 'f' to denote Fast Fourier Transform, hence changed to FFT
* Acc changed to Acceleration
* Gyro changed to Gyration
* mean() changed to Mean
* std() changed to Standard Deviation
* all axis clearly identified as 'in X/Y/Z', referring to dimentions

This gives a data frame with the variable names of:

 [1] "Subject ID"                                              
 [2] "Activity"                                                
 [3] "Time Body Acceleration Mean in X"                        
 [4] "Time Body Acceleration Mean in Y"                        
 [5] "Time Body Acceleration Mean in Z"                        
 [6] "Time Body Acceleration Standard Diviation in X"          
 [7] "Time Body Acceleration Standard Diviation in Y"          
 [8] "Time Body Acceleration Standard Diviation in Z"          
 [9] "Time Gravity Acceleration Mean in X"                     
[10] "Time Gravity Acceleration Mean in Y"                     
[11] "Time Gravity Acceleration Mean in Z"                     
[12] "Time Gravity Acceleration Standard Diviation in X"       
[13] "Time Gravity Acceleration Standard Diviation in Y"       
[14] "Time Gravity Acceleration Standard Diviation in Z"       
[15] "Time Body Acceleration Jerk Mean in X"                   
[16] "Time Body Acceleration Jerk Mean in Y"                   
[17] "Time Body Acceleration Jerk Mean in Z"                   
[18] "Time Body Acceleration Jerk Standard Diviation in X"     
[19] "Time Body Acceleration Jerk Standard Diviation in Y"     
[20] "Time Body Acceleration Jerk Standard Diviation in Z"     
[21] "Time Body Gyration Mean in X"                            
[22] "Time Body Gyration Mean in Y"                            
[23] "Time Body Gyration Mean in Z"                            
[24] "Time Body Gyration Standard Diviation in X"              
[25] "Time Body Gyration Standard Diviation in Y"              
[26] "Time Body Gyration Standard Diviation in Z"              
[27] "Time Body Gyration Jerk Mean in X"                       
[28] "Time Body Gyration Jerk Mean in Y"                       
[29] "Time Body Gyration Jerk Mean in Z"                       
[30] "Time Body Gyration Jerk Standard Diviation in X"         
[31] "Time Body Gyration Jerk Standard Diviation in Y"         
[32] "Time Body Gyration Jerk Standard Diviation in Z"         
[33] "Time Body Acceleration Magnitude Mean"                   
[34] "Time Body Acceleration Magnitude Standard Diviation"     
[35] "Time Gravity Acceleration Magnitude Mean"                
[36] "Time Gravity Acceleration Magnitude Standard Diviation"  
[37] "Time Body Acceleration Jerk Magnitude Mean"              
[38] "Time Body Acceleration Jerk Magnitude Standard Diviation"
[39] "Time Body Gyration Magnitude Mean"                       
[40] "Time Body Gyration Magnitude Standard Diviation"         
[41] "Time Body Gyration Jerk Magnitude Mean"                  
[42] "Time Body Gyration Jerk Magnitude Standard Diviation"    
[43] "FFT Body Acceleration Mean in X"                         
[44] "FFT Body Acceleration Mean in Y"                         
[45] "FFT Body Acceleration Mean in Z"                         
[46] "FFT Body Acceleration Standard Diviation in X"           
[47] "FFT Body Acceleration Standard Diviation in Y"           
[48] "FFT Body Acceleration Standard Diviation in Z"           
[49] "FFT Body Acceleration Jerk Mean in X"                    
[50] "FFT Body Acceleration Jerk Mean in Y"                    
[51] "FFT Body Acceleration Jerk Mean in Z"                    
[52] "FFT Body Acceleration Jerk Standard Diviation in X"      
[53] "FFT Body Acceleration Jerk Standard Diviation in Y"      
[54] "FFT Body Acceleration Jerk Standard Diviation in Z"      
[55] "FFT Body Gyration Mean in X"                             
[56] "FFT Body Gyration Mean in Y"                             
[57] "FFT Body Gyration Mean in Z"                             
[58] "FFT Body Gyration Standard Diviation in X"               
[59] "FFT Body Gyration Standard Diviation in Y"               
[60] "FFT Body Gyration Standard Diviation in Z"               
[61] "FFT Body Acceleration Magnitude Mean"                    
[62] "FFT Body Acceleration Magnitude Standard Diviation" 

