# CleaningDataProject
Cleaning Data Course project

Program for the Course Project Getting and Cleaning data
May 2015
function analysis_data 
==================================================================
Parameters:
==================================================================
outcome1:"./X_train.txt"
outcome2:"./X_test.txt"
outcome3:"./y_train.txt"
outcome4:"./y_test.txt"
outcome5:"./activity_labels.txt"
outcome6:"./features.txt"
outcome7:"./subject_train.txt"
outcome8:"./subject_test.txt"
nc: 563 -- Number of columns plus Activity and Subject==

## Package installation
================================================================
In this section, call the packages necessary for the functions invoked in the program

install.packages("dplyr")
library(dplyr)
install.packages("fBasics")
library(fBasics)

## Point 1 - Merge
==================================================================
Read the archives with the data set generating two frames:train and test. As both archives have the same dimentions, I merged generating a new data frame tmerge

## Point 2 - mean and standard deviation
==================================================================
Use the functions colMeans and colStdevs to generate the mean and standard deviation for each measurement (column)

## Point 3
==================================================================
Read the archives with the data label generating two frames:trainlab and testlab. Read also the archive with the activity name. Merge the archives label. Rename the columns of the activity data frame V1->act (activity) and V2->name:act (activity name).
Merge the data frame with Set data and Label data, the result is merged with the activity data frame to named the data set

## Point 4
==================================================================
The data frame result of point 3 is labeled with the variables used on the feature vector. Read the archive Features, and put this names in the columns. The join is make with the variable V1 of the features data frame

## Point 5
=================================================================
Read the subjects data(train and test), each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. This information is merged with the data frame of point 4. In the data frame result, I create another data set with the average of each variable for each activity and each subject.

Return 
==================================================================
the data frame with the average result, 30 subject x 6 activities x (561 observations + 5 group columns)
